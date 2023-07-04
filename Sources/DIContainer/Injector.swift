//
//  File.swift
//  
//
//  Created by Linkon on 4/7/23.
//

import Foundation

@propertyWrapper
public struct Inject<T>{
    public let wrappedValue:T
    public init(){
        self.wrappedValue = DIContainer.shared.resolve(type: T.self)
    }
}
