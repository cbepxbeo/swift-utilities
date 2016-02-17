//
//  MathHelpers.swift
//  
//
//  Created by Егор Бойко on 17.02.2016.
//

public struct MathHelpers {
    public static func clamp<T: Comparable>(_ value: T, to: ClosedRange<T>) -> T {
        return clamp(value, min: to.lowerBound, max: to.upperBound)
    }

    public static func clamp<T: Comparable>(_ value: T, min lower: T, max upper: T) -> T {
         return min(max(value, lower), upper)
     }
}
