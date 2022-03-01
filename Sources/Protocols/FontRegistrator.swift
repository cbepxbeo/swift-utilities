/*

Project: SwiftUtilities
File: AnyHashableMetatype.swift
Created by: Egor Boyko
Date: 04.02.2022


Status: #Complete | #Not decorated

*/

import Foundation
import SwiftUI

public protocol FontRegistrator {}

extension FontRegistrator {
    public func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
