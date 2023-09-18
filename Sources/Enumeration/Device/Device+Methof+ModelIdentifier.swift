/*
 
 Project: SwiftUtilities
 File: Device+Methof+ModelIdentifier.swift
 Created by: Egor Boyko
 Date: 18.09.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

extension Device {
    static func modelIdentifier() -> String? {
        if let simulatorModelIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
            return simulatorModelIdentifier
        }
        var sysinfo = utsname()
        uname(&sysinfo)
        if let model: String = String(
            bytes: Data(
                bytes: &sysinfo.machine,
                count: Int(_SYS_NAMELEN)
            ),
            encoding: .ascii
        ) {
            return model.trimmingCharacters(in: .controlCharacters)
        }
        return nil
    }
}
