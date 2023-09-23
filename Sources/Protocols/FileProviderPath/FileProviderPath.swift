/*
 
 Project: SwiftUtilities
 File: FileProviderPath.swift
 Created by: Egor Boyko
 Date: 15.05.2021
 
 
 Status: #Complete | #Not decorated
 
 */

public protocol FileProviderPath: RawRepresentable, CaseIterable, CustomStringConvertible
where RawValue == String  {}

