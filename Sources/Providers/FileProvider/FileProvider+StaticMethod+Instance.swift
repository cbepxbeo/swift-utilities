/*
 
 Project: SwiftUtilities
 File: FileProvider+Main.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #Complete | #Not decorated
 
 */

fileprivate var instances = [AnyHashableMetatype: Any]()

extension FileProvider {
    static var instance: FileProvider<T>? {
        get {
            return instances[AnyHashableMetatype(T.self), default: [0]] as? FileProvider<T>
        }
        set {
            instances[AnyHashableMetatype(T.self)] = newValue
        }
    }
    
    public static func instance(from type: T.Type) -> FileProvider<T> {
        if let provider = FileProvider<T>.instance {
            return provider
        } else {
            let fileProvider = FileProvider(type: type)
            FileProvider<T>.instance = fileProvider
            return fileProvider
        }
    }
}
