//
//  FixedCapacityArray.swift
//  数组
//
//  Created by 周伟克 on 2020/9/2.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation

class FixedCapacityArray<T> {
    
    private var ptr: UnsafeMutablePointer<T?>
    private var capacity: UInt
    private(set) var size = 0
    init(capacity: UInt) {
        self.capacity = capacity
        ptr = UnsafeMutablePointer<T?>.allocate(capacity: Int(capacity))
        ptr.initialize(repeating: nil, count: 0)
    }
    
    func add(_ element: T) {
        ensureCapacity()
        self[size] = element
        size += 1
    }
    
    
    func ensureCapacity() {
        let newCapacity: UInt
        if capacity == 0 {
            newCapacity = 1
        } else if capacity == 1 {
            newCapacity = 2
        } else {
            newCapacity = capacity + capacity / 2
        }
        let newPtr = UnsafeMutablePointer<T?>.allocate(capacity: Int(newCapacity))
        newPtr.initialize(repeating: nil, count: Int(newCapacity))
        for index in 0 ..< size {
            newPtr.advanced(by: index).initialize(to: ptr.advanced(by: index).pointee)
        }
        releasePtr()
        ptr = newPtr
        print("扩容前：\(capacity)   扩容后：\(newCapacity)")
        capacity = newCapacity
        
        
    }
    
    subscript(index: Int) -> T {
        set {
            let target = ptr.advanced(by: index)
            target.deinitialize(count: 1)
            target.initialize(to: newValue)
        }
        get {
            let target = ptr.advanced(by: index)
            return target.pointee!
        }
    }
    deinit {
        releasePtr()
    }
    
    func releasePtr() {
        ptr.deinitialize(count: Int(capacity))
        ptr.deallocate()
    }
}
