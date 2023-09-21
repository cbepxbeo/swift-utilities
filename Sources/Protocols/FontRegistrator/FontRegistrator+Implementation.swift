/*
 
 Project: SwiftUtilities
 File: FontRegistrator+Implementation.swift
 Created by: Egor Boyko
 Date: 18.09.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation
import CoreGraphics
import CoreText

extension FontRegistrator {
    public func register(
        bundle: Bundle,
        name fontName: String,
        extension fontExtension: String) {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
