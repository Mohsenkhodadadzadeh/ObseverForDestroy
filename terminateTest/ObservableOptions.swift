//
//  ObservableOptions.swift
//  terminateTest
//
//  Created by mohsen khodadadzadeh on 6/12/19.
//  Copyright © 2019 mohsen. All rights reserved.
//

import Foundation


public struct ObservableOptions: OptionSet {
    
    public static let initial = ObservableOptions(rawValue: 1 << 0)
    
    public static let destroy = ObservableOptions(rawValue: 1 << 1)
    
    public static let undefined = ObservableOptions(rawValue: 1 << 2)
    
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
