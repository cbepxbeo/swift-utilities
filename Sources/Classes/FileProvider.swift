/*

Project: SwiftUtilities
File: FileProvider.swift
Created by: Egor Boyko
Date: 16.05.2021


Status: #Complete | #Not decorated

*/


import Foundation

fileprivate var instances = [AnyHashableMetatype: Any]()

final public class FileProvider<T: FileProviderPath>: ObservableObject {
    
    public class func getFromType(enumWithPaths type: T.Type) -> FileProvider<T> {
        if let provider = FileProvider<T>.instance {
            return provider
        } else {
            let fileProvider = FileProvider(typeToProvider: type)
            FileProvider<T>.instance = fileProvider
            return fileProvider
        }
    }
    
    private init(typeToProvider: T.Type){
        self.paths = FileProvider<T>.getPaths()
        self.queue = .global(qos: .background)
        self.fileManager = .default
        self.cache = .init()
    }
    
    public let fileManager: FileManager
    public let cache: NSCache<NSString, NSData>
    private let paths: [String : URL]
    private let queue: DispatchQueue
    
    
    public func getPath(_ directory: T) -> URL {
        self.paths[directory.value]!
    }
    

    //MARK: - Получение даты
    ///Немедленное получение NSData из указанной папки
    public func getData(nsDataDirectory directory: T, fileName: String) -> NSData? {
        let filePath = self.getPath(directory).appendingPathComponent(fileName)
        guard self.fileManager.fileExists(atPath: filePath.path) else { return nil }
        return NSData(contentsOfFile: filePath.path)
    }

    ///Получение NSData из указанной папки по завершению
    public func getData(
        nsDataDirectory directory: T,
        fileName: String,
        completion: @escaping (_ data: NSData?) -> ()){
            self.queue.async { [unowned self] in
                completion(self.getData(nsDataDirectory: directory, fileName: fileName))
            }
    }
    ///Фоновое получение Data с диска из указанной папки с обработчиком по завершению
    public func getData(dataDirectory directory: T, fileName: String) -> Data? {
        guard
            let nsData = self.getData(nsDataDirectory: directory, fileName: fileName)
        else { return nil }
        return Data(referencing: nsData)
    }
    
    ///Фоновое получение Data с диска из указанной папки с обработчиком по завершению
    public func getData(dataDirectory directory: T, fileName: String, completion: @escaping (_ data: Data?) -> Void){
        self.queue.async { [unowned self] in
            completion(self.getData(dataDirectory: directory, fileName: fileName))
        }
    }
    ///Сохранение Data на диск, в указаную директорию
    public func saveData(
                _ directory: T,
                data: Data,
                fileName: String,
                savedToCache: Bool = false,
                _ handler: @escaping (_ status: Bool) -> () = { _ in }){
            
        self.queue.async { [unowned self] in
            if savedToCache {
                self.cache.setObject(data as NSData, forKey: NSString(string: fileName))
            }
            do {
                try data.write(to: self.getPath(directory).appendingPathComponent(fileName))
                handler(true)
            } catch {
                handler(false)
            }
        }
    }
    
    //MARK: Удаление файлов
    ///Удаление всех файлов в директории
    public func removeAllFilesFromDirectory(
        _ directory: T,
        _ completion: @escaping (_ removeStatus: Bool) -> () = { _ in }){
        
        self.queue.async { [unowned self] in
            do {
                let files = try fileManager.contentsOfDirectory(atPath: self.getPath(directory).path)
                for file in files {
                    do {
                        try fileManager.removeItem(at: self.getPath(directory).appendingPathComponent(file))
                    } catch {
                        completion(false)
                    }
                }
                completion(true)
            } catch {
                completion(false)
            }
        }
    }
    
    
    //MARK: Размер директории
    ///Размер директории
    public func getSizeDirectory(
        _ directory: T,
        _ completion: @escaping (_ size: DirectorySize ) -> () = { _ in }) {
            
        let defaultCell = DirectorySize(0, string: "")
        self.queue.async { [unowned self] in
            var summ : UInt64 = 0
                do {
                    let files = try FileManager.default.contentsOfDirectory(atPath: self.getPath(directory).path)
                    for file in files {
                        summ += self.getPath(directory).appendingPathComponent(file).size.UInt64
                    }
                    let result = URL(string: "/nil")?.convertSize(fileSize: summ) ?? URL.FileSize(string: "", float: 0, UInt64: 0)
                    completion(DirectorySize(result.UInt64, string: result.string))
                } catch {
                    completion(defaultCell)
                }
        }
    }
}


public enum FileProviderPaths: String, FileProviderPath {
    case images
    case video
    case other
}


public extension FileProvider where T == FileProviderPaths {
    static var shared : FileProvider {
        FileProvider.getFromType(enumWithPaths: FileProviderPaths.self)
    }
}


extension FileProvider {
    
    ///Обертка для получения дженерика в статике
    private static var instance: FileProvider<T>? {
      get {
        return instances[AnyHashableMetatype(T.self), default: [0]] as? FileProvider<T>
      }
      set {
          instances[AnyHashableMetatype(T.self)] = newValue
      }
    }
    
    ///Создание директорий
    private static func createDirectory(folder: String) -> URL {
        let manager: FileManager, defaultPathsSearch: URL, newFolder: URL
        manager = .default

        do {
            defaultPathsSearch = try manager.url(
                for: FileManager.SearchPathDirectory.cachesDirectory,
                   in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil,
                   create: true)
        } catch {
            fatalError("--- \(folder)")
        }

        newFolder = defaultPathsSearch.appendingPathComponent(folder)

        if !manager.fileExists(atPath: newFolder.path){
            do {
                try manager.createDirectory(at: newFolder, withIntermediateDirectories: false, attributes: nil)
            }
            catch {
                fatalError("-- \(folder)")
            }
        }
        return newFolder
    }
    
    ///Вспомогательный метод, сборки путей из Enum
    private static func getPaths() -> [String : URL] {
        var temp: [String : URL] = [:]
        T.allCases.forEach {
            guard
                let string = $0.rawValue as? String
            else {
                fatalError("----")
            }
            temp[string] = FileProvider<T>.createDirectory(folder: string)
        }
        return temp
    }
}



extension FileProvider {
    
    public struct DirectorySize {
        public let uint64: UInt64
        public let string: String
        
        public init(_ uint64: UInt64 = 0, string: String = "Counting in progress..."){
            self.uint64 = uint64
            self.string = string
        }
    }
    
}


extension URL {
    
    var size: FileSize {
        guard let size = fileSize() else {return FileSize(string: "size not defined", float: 0, UInt64: 0)}
        return size
    }
    
    func fileSize(size: UInt64? = nil) -> FileSize? {
        
        if size == nil {
            guard let size = try? FileManager.default.attributesOfItem(atPath: path)[FileAttributeKey.size],
                  let fileSize = size as? UInt64 else {
                      return nil
                  }
            return convertSize(fileSize: fileSize)
        } else { return convertSize(fileSize: size!) }
    }
    
    func convertSize(fileSize: UInt64) -> FileSize {

        if fileSize < 1023 {
            return FileSize(string: String(format: "%lu byte", CUnsignedLong(fileSize)), float: Float(fileSize), UInt64: fileSize)
        }

        var floatSize = Float(fileSize / 1024)
        if floatSize < 1023 {
            return FileSize(string: String(format: "%.1f kb", floatSize), float: Float(fileSize), UInt64: fileSize)
        }

        floatSize = floatSize / 1024
        if floatSize < 1023 {
            return FileSize(string: String(format: "%.1f mb", floatSize), float: Float(fileSize), UInt64: fileSize)
        }

        floatSize = floatSize / 1024
        return FileSize(string: String(format: "%.1f gb", floatSize), float: Float(fileSize), UInt64: fileSize)
    }
    
    
    struct FileSize {
        let string: String
        let float: Float
        let UInt64: UInt64
    }
}
