//
//  AddressInfo.swift
//
//
//  Created by Егор Бойко on 21.12.2015.
//
import Darwin

public struct AddressInfo {
    public init(address: UInt) {
        self.address = address
        var i = dl_info()
        dladdr(UnsafePointer<Void>(bitPattern: address), &i)
        self.info = i
    }
	private let info: dl_info
	public let address: UInt
}

extension AddressInfo {
    public var image: String {
        if info.dli_fname != nil, let fname = String.fromCString(info.dli_fname), _ = fname.rangeOfString("/", options: NSStringCompareOptions.BackwardsSearch, range: nil, locale: nil) {
            return (fname as NSString).lastPathComponent
        } else {
            return "-?-"
        }
    }
    
    public var symbol: String {
        if let symbol = String.fromCString(info.dli_sname) {
            return symbol
        } else if let _ = String.fromCString(info.dli_fname) {
            return self.image
        } else {
            return String(format: "0x%1x", info.dli_saddr)
        }
    }
    
    public var offset: Int {
        if let _ = String.fromCString(info.dli_sname) {
            return info.dli_saddr.distanceTo(UnsafeMutablePointer<Void>(bitPattern: address))
        } else if let _ = String.fromCString(info.dli_fname) {
            return info.dli_fbase.distanceTo(UnsafeMutablePointer<Void>(bitPattern: address))
        } else {
            return info.dli_saddr.distanceTo(UnsafeMutablePointer<Void>(bitPattern: address))
        }
    }
}


extension AddressInfo {
    public func formattedDescriptionForIndex(index: Int) -> String {
        return self.image.nulTerminatedUTF8.withUnsafeBufferPointer { (buffer: UnsafeBufferPointer<UTF8.CodeUnit>) -> String in
            return String(format: "%-4ld%-35s 0x%016llx %@ + %ld", index, buffer.baseAddress, self.address, self.symbol, self.offset)
        }
    }
}
