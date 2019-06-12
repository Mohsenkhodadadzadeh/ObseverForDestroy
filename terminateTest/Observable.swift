//
//  Observable.swift
//  terminateTest
//
//  Created by mohsen khodadadzadeh on 6/12/19.
//  Copyright © 2019 mohsen. All rights reserved.
//

import Foundation


public class Observable<Type> {
    fileprivate class CallBack {
        
        fileprivate weak var observer: AnyObject?
        fileprivate let options: [ObservableOptions]
        
        fileprivate let closure: (Type, ObservableOptions) -> Void
        
        fileprivate init(observer: AnyObject, options:[ObservableOptions], closure: @escaping (Type, ObservableOptions) -> Void) {
            self.observer = observer
            self.options = options
            self.closure = closure
        }
    }
    
    public var value: Type
    
    
    public var AffectStates: ObservableOptions {
        set {
            if newValue != .destroy {
              removeNilObserverCallbacks()
            }
            notifyCallbacks(value: value, option: newValue)
        }
        get {
            return .undefined
        }
    }
    
    public init(_ value: Type) {
        self.value = value
    }
    
    
    private func removeNilObserverCallbacks() {
        callBacks = callBacks.filter {$0.observer != nil }
    }
    
    private func notifyCallbacks(value: Type, option: ObservableOptions) {
        
        let callBackToNotify = callBacks.filter { $0.options.contains(option) }
        
        callBackToNotify.forEach { $0.closure(value, option) }
    }
    
    private var callBacks: [CallBack] = []
    
    public func addObserver (_ observer: AnyObject, removeIfExist: Bool = true, options: [ObservableOptions] = [.initial], closure: @escaping(Type, ObservableOptions) -> Void ) {
        if removeIfExist {
            removeObserver(observer)
        }
        
        let callback = CallBack(observer: observer, options: options, closure: closure)
        callBacks.append(callback)
        
        if options.contains(.initial) {
            closure(value, .initial)
        }
        
    }
    
    public func removeObserver(_ observer: AnyObject) {
        callBacks = callBacks.filter {$0.observer !== observer}
    }
}
