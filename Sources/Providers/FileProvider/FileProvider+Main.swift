/*
 
 Project: SwiftUtilities
 File: FileProvider+Main.swift
 Created by: Egor Boyko
 Date: 22.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension FileProvider where T == DefaultFileProviderPath {
     public static var main : FileProvider {
         FileProvider.instance(from: DefaultFileProviderPath.self)
    }
}
