/*
 
 Project: SwiftUtilities
 File: Device+StaticPropertiy+Model.swift
 Created by: Egor Boyko
 Date: 18.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension Device {
    public static var model: String { self.current.rawValue }
}
