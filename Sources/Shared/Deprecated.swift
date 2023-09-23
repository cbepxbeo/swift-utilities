/*
 
 Project: SwiftUtilities
 File: Deprecated.swift
 Created by: Egor Boyko
 Date: 21.09.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

extension FontRegistrator {
    @available(*,deprecated, renamed: "register", message: "The method has been renamed")
    public func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        self.register(bundle: bundle, name: fontName, extension: fontExtension)
    }
}

@available(*,deprecated, message: "Use UpperCamelCase type. Method transform")
public func fromCamelCase(value: String, separator: String = "-") -> String {
    UpperCamelCase(stringLiteral: value).transform(separator: separator)
}

//MARK: FileProvider
extension FileProvider {
    @available(*,deprecated, renamed: "remove", message: "The method has been renamed")
    public func removeAllFilesFromDirectory(
        _ directory: T,
        _ completion: @escaping (_ removeStatus: Bool) -> () = { _ in }){
            self.remove(from: directory, completion)
        }
    
    @available(*,deprecated, renamed: "receive", message: "The method has been renamed")
    public func getData(nsDataDirectory directory: T, fileName: String) -> NSData? {
        self.receive(from: directory, fileName: fileName)
    }
    
    @available(*,deprecated, renamed: "receive", message: "The method has been renamed")
    public func getData(
        nsDataDirectory directory: T,
        fileName: String,
        completion: @escaping (_ data: NSData?) -> ()){
            self.receive(from: directory, fileName: fileName, completion: completion)
        }
    
    @available(*,deprecated, renamed: "receive", message: "The method has been renamed")
    public func getData(dataDirectory directory: T, fileName: String) -> Data? {
        self.receive(from: directory, fileName: fileName)
    }
    
    @available(*,deprecated, renamed: "receive", message: "The method has been renamed")
    public func getData(dataDirectory directory: T, fileName: String, completion: @escaping (_ data: Data?) -> Void){
        self.receive(from: directory, fileName: fileName, completion: completion)
    }
    
    @available(*,deprecated, renamed: "instance", message: "The method has been renamed")
    public class func getFromType(enumWithPaths type: T.Type) -> FileProvider<T> {
        self.instance(from: type)
    }
    
    @available(*,deprecated, renamed: "save", message: "The method has been renamed")
    public func saveData(
        _ directory: T,
        data: Data,
        fileName: String,
        savedToCache: Bool = false,
        _ handler: @escaping (_ status: Bool) -> () = { _ in }){
            self.save(to: directory, fileName: fileName, data, completion: handler)
        }
    
    @available(*,deprecated, renamed: "size", message: "The method has been renamed")
    public func getSizeDirectory(
        _ directory: T,
        _ completion: @escaping (_ size: DirectorySize ) -> () = { _ in }) {
            self.size(of: directory, completion)
        }
    
}

extension FileProvider where T == DefaultFileProviderPath {
    @available(*,deprecated, renamed: "main", message: "The property has been renamed")
    public static var shared : FileProvider { .main }
}

