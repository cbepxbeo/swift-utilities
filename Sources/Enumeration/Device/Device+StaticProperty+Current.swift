/*
 
 Project: SwiftUtilities
 File: Device+StaticProperty+Current.swift
 Created by: Egor Boyko
 Date: 18.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension Device {
    static var _current: Device? = nil
    
    public static var current: Device {
        if let _current { return _current }
        
        let map: [String: Device] = [
            "iPhone8,4"     : .iPhoneSE,
            "iPhone12,8"    : .iPhoneSE2,
            "iPhone14,6"    : .iPhoneSE3,
            
            "iPhone8,1"     : .iPhone6S,
            "iPhone8,2"     : .iPhone6SPlus,
            
            "iPhone9,1"     : .iPhone7,
            "iPhone9,3"     : .iPhone7,
            
            "iPhone9,2"     : .iPhone7Plus,
            "iPhone9,4"     : .iPhone7Plus,
            
            "iPhone10,1"    : .iPhone8,
            "iPhone10,4"    : .iPhone8,
            "iPhone10,2"    : .iPhone8Plus,
            "iPhone10,5"    : .iPhone8Plus,
            
            "iPhone10,3"    : .iPhoneX,
            "iPhone10,6"    : .iPhoneX,
            
            "iPhone11,8"    : .iPhoneXR,
            "iPhone11,2"    : .iPhoneXS,
            "iPhone11,4"    : .iPhoneXSMax,
            "iPhone11,6"    : .iPhoneXSMax,
            
            "iPhone12,1"    : .iPhone11,
            "iPhone12,3"    : .iPhone11Pro,
            "iPhone12,5"    : .iPhone11ProMax,
            
            "iPhone13,1"    : .iPhone12Mini,
            "iPhone13,2"    : .iPhone12,
            "iPhone13,3"    : .iPhone12Pro,
            "iPhone13,4"    : .iPhone12ProMax,
            
            "iPhone14,4"    : .iPhone13Mini,
            "iPhone14,5"    : .iPhone13,
            "iPhone14,2"    : .iPhone13Pro,
            "iPhone14,3"    : .iPhone13ProMax,
            "iPhone15,4"    : .iPhone15,
            "iPhone15,5"    : .iPhone15Plus,
            "iPhone16,1"    : .iPhone15Pro,
            "iPhone16,2"    : .iPhone15ProMax,
            
            "iPhone14,7"    : .iPhone14,
            "iPhone14,8"    : .iPhone14Plus,
            "iPhone15,2"    : .iPhone14Pro,
            "iPhone15,3"    : .iPhone14ProMax,
            
            //MARK: Map - iPod
            "iPod1,1"       : .iPod1,
            "iPod2,1"       : .iPod2,
            "iPod3,1"       : .iPod3,
            "iPod4,1"       : .iPod4,
            "iPod5,1"       : .iPod5,
            "iPod7,1"       : .iPod6,
            "iPod9,1"       : .iPod7,
            
            //MARK: Map - iPad
            "iPad6,11"      : .iPad5,
            "iPad6,12"      : .iPad5,
            "iPad7,5"       : .iPad6,
            "iPad7,6"       : .iPad6,
            "iPad7,11"      : .iPad7,
            "iPad7,12"      : .iPad7,
            "iPad11,6"      : .iPad8,
            "iPad11,7"      : .iPad8,
            "iPad12,1"      : .iPad9,
            "iPad12,2"      : .iPad9,
            "iPad13,18"     : .iPad10,
            "iPad13,19"     : .iPad10,
            
            //MARK: Map - iPad Mini
            "iPad5,1"       : .iPadMini4,
            "iPad5,2"       : .iPadMini4,
            "iPad11,1"      : .iPadMini5,
            "iPad11,2"      : .iPadMini5,
            "iPad14,1"      : .iPadMini6,
            "iPad14,2"      : .iPadMini6,
            
            //MARK: Map - iPad Pro
            "iPad6,3"       : .iPadPro9_7,
            "iPad6,4"       : .iPadPro9_7,
            "iPad7,3"       : .iPadPro10_5,
            "iPad7,4"       : .iPadPro10_5,
            "iPad6,7"       : .iPadPro_12,
            "iPad6,8"       : .iPadPro_12,
            "iPad7,1"       : .iPadPro_12_2,
            "iPad7,2"       : .iPadPro_12_2,
            "iPad8,1"       : .iPadPro_11,
            "iPad8,2"       : .iPadPro_11,
            "iPad8,3"       : .iPadPro_11,
            "iPad8,4"       : .iPadPro_11,
            "iPad8,9"       : .iPadPro_11_2,
            "iPad8,10"      : .iPadPro_11_2,
            "iPad13,4"      : .iPadPro_11_3,
            "iPad13,5"      : .iPadPro_11_3,
            "iPad13,6"      : .iPadPro_11_3,
            "iPad13,7"      : .iPadPro_11_3,
            "iPad14,3"      : .iPadPro_11_4,
            "iPad14,4"      : .iPadPro_11_4,
            "iPad8,5"       : .iPadPro_12_3,
            "iPad8,6"       : .iPadPro_12_3,
            "iPad8,7"       : .iPadPro_12_3,
            "iPad8,8"       : .iPadPro_12_3,
            "iPad8,11"      : .iPadPro_12_4,
            "iPad8,12"      : .iPadPro_12_4,
            "iPad13,8"      : .iPadPro_12_5,
            "iPad13,9"      : .iPadPro_12_5,
            "iPad13,10"     : .iPadPro_12_5,
            "iPad13,11"     : .iPadPro_12_5,
            "iPad14,5"      : .iPadPro_12_6,
            "iPad14,6"      : .iPadPro_12_6,
            
            //MARK: Map - iPad Air
            "iPad5,3"       : .iPadAir2,
            "iPad5,4"       : .iPadAir2,
            "iPad11,3"      : .iPadAir3,
            "iPad11,4"      : .iPadAir3,
            "iPad13,1"      : .iPadAir4,
            "iPad13,2"      : .iPadAir4,
            "iPad13,16"     : .iPadAir5,
            "iPad13,17"     : .iPadAir5,
        ]
        
        if let identifier = self.modelIdentifier(),
           let model = map[identifier] {
            self._current = model
            return model
        }
        self._current = .unrecognized
        return .unrecognized
    }
}
