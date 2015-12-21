//
//  Functions.swift
//
//
//  Created by Егор Бойко on 21.12.2015.
//


public func mutate<T>(_ arg: inout T, _ body: (inout T) -> Void) {
  body(&arg)
}
