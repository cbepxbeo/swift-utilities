//
//  Double.swift
//
//
//  Created by Егор Бойко on 05.02.2016.
//

public extension Double {
    func scale(from from: ClosedInterval<Double>, to: ClosedInterval<Double>, clamp: Bool = false) -> Double {
        guard from != to else {
            return self
        }
        var result = ((self - from.start) / (from.end - from.start)) * (to.end - to.start) + to.start
        if clamp {
            result = max(min(result, to.end), to.start)
        }
        return result
    }
}
