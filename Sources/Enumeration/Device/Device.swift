/*
 
 Project: SwiftUtilities
 File: Device.swift
 Created by: Egor Boyko
 Date: 18.09.2023
 
 Status: #Complete | #Not decorated
 
 */


public enum Device: String {
    //MARK: iPhone
    case iPhoneSE           = "iPhone SE"
    case iPhoneSE2          = "iPhone SE 2nd gen"
    case iPhoneSE3          = "iPhone SE 3nd gen"
    
    case iPhone6S           = "iPhone 6S"
    case iPhone6SPlus       = "iPhone 6S Plus"
    
    case iPhone7            = "iPhone 7"
    case iPhone7Plus        = "iPhone 7 Plus"
    
    case iPhone8            = "iPhone 8"
    case iPhone8Plus        = "iPhone 8 Plus"
    
    case iPhoneX            = "iPhone X"
    
    case iPhoneXS           = "iPhone XS"
    case iPhoneXSMax        = "iPhone XS Max"
    case iPhoneXR           = "iPhone XR"
    
    case iPhone11           = "iPhone 11"
    case iPhone11Pro        = "iPhone 11 Pro"
    case iPhone11ProMax     = "iPhone 11 Pro Max"
    
    case iPhone12Mini       = "iPhone 12 Mini"
    case iPhone12           = "iPhone 12"
    case iPhone12Pro        = "iPhone 12 Pro"
    case iPhone12ProMax     = "iPhone 12 Pro Max"
    
    case iPhone13Mini       = "iPhone 13 Mini"
    case iPhone13           = "iPhone 13"
    case iPhone13Pro        = "iPhone 13 Pro"
    case iPhone13ProMax     = "iPhone 13 Pro Max"
    
    case iPhone14           = "iPhone 14"
    case iPhone14Plus       = "iPhone 14 Plus"
    case iPhone14Pro        = "iPhone 14 Pro"
    case iPhone14ProMax     = "iPhone 14 Pro Max"
    
    //MARK: iPod
    case iPod1              = "iPod 1"
    case iPod2              = "iPod 2"
    case iPod3              = "iPod 3"
    case iPod4              = "iPod 4"
    case iPod5              = "iPod 5"
    case iPod6              = "iPod 6"
    case iPod7              = "iPod 7"
    
    //MARK: iPad
    case iPad5              = "iPad 5"
    case iPad6              = "iPad 6"
    case iPad7              = "iPad 7"
    case iPad8              = "iPad 8"
    case iPad9              = "iPad 9"
    case iPad10             = "iPad 10"
    
    //MARK: iPadAir
    case iPadAir2           = "iPad Air 2"
    case iPadAir3           = "iPad Air 3"
    case iPadAir4           = "iPad Air 4"
    case iPadAir5           = "iPad Air 5"
    
    //MARK: iPad Mini
    case iPadMini4          = "iPad Mini 4"
    case iPadMini5          = "iPad Mini 5"
    case iPadMini6          = "iPad Mini 6"
    
    //MARK: iPad Pro
    case iPadPro9_7         = "iPad Pro 9.7"
    case iPadPro10_5        = "iPad Pro 10.5"
    
    case iPadPro_11         = "iPad Pro 11"
    case iPadPro_11_2       = "iPad Pro 11 2nd gen"
    case iPadPro_11_3       = "iPad Pro 11 3rd gen"
    case iPadPro_11_4       = "iPad Pro 11 4th gen"
    
    case iPadPro_12         = "iPad Pro 12.9 - 1st"
    case iPadPro_12_2       = "iPad Pro 12.9 - 2nd"
    case iPadPro_12_3       = "iPad Pro 12.9 - 3rd"
    case iPadPro_12_4       = "iPad Pro 12.9 - 4th"
    case iPadPro_12_5       = "iPad Pro 12.9 - 5th"
    case iPadPro_12_6       = "iPad Pro 12.9 - 6th"
    
    case unrecognized       = "unrecognized"
}
