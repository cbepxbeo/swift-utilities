/*

Project: SwiftUtilities
File: FileProvider.swift
Created by: Egor Boyko
Date: 16.05.2021


Status: #Complete | #Not decorated

*/

import Foundation

public final class FileProvider<T: FileProviderPath>: ObservableObject {
    init(type: T.Type){
        self.paths = FileProvider<T>.paths()
    }
    var paths: [String : URL]
}
