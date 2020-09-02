//
//  CustomArray.swift
//  数组
//
//  Created by 周伟克 on 2020/9/2.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation

class CustomArray<T>: CustomStringConvertible {
    
    private var ptr: UnsafeMutablePointer<T?>
    private var capacity = 0
    private let defaultCapacity = 10
    private(set) var size = 0
    
    init(capacity: Int) {
        self.capacity = max(capacity, defaultCapacity)
        ptr = UnsafeMutablePointer<T?>.allocate(capacity: Int(capacity))
        ptr.initialize(repeating: nil, count: 0)
    }
    
    
    init(arrayLiteral: T...) {
        capacity = max(arrayLiteral.count, defaultCapacity)
        ptr = UnsafeMutablePointer<T?>.allocate(capacity: capacity)
        for i in 0 ..< arrayLiteral.count {
            ptr.advanced(by: i).initialize(to: arrayLiteral[i])
        }
        size = arrayLiteral.count
    }

    
    /// 追加
    func add(_ element: T) {
        
        insert(element, at: size)
    }
    
    /// 插入
    func insert(_ element: T, at index: Int) {
        ensureCapacity()
        let movedCount = size - index
        for cursor in 0 ..< movedCount {
            self[size - cursor] = self[size - cursor - 1]
        }
        self[index] = element
        size += 1
    }
    
    /// 删除
    func remove(at index: UInt) -> T {
        if index >= size {
            fatalError("\(index) out of bounds 0 ..< \(size)")
        }
        let old = ptr.advanced(by: Int(index)).pointee!
        let start = Int(index)
        let end = size - 1
        for cursor in start ..< end {
            self[cursor] = self[cursor + 1]
        }
        self[size - 1] = nil
        size -= 1
        return old
    }
    
    /// 删除最后
    func removeLast() -> T {
        if size == 0 {
            fatalError("cann't remove last from an empty array")
        }
        return remove(at: UInt(size - 1))
    }
    
    /// 扩容
    func ensureCapacity() {
        if capacity > size {
            return
        }
        let newCapacity = capacity + capacity >> 1
        let newPtr = UnsafeMutablePointer<T?>.allocate(capacity: newCapacity)
        newPtr.initialize(repeating: nil, count: newCapacity)
        for index in 0 ..< size {
            newPtr.advanced(by: index).initialize(to: ptr.advanced(by: index).pointee)
        }
        releasePtr()
        ptr = newPtr
        print("扩容前：\(capacity)   扩容后：\(newCapacity)")
        capacity = newCapacity
        
        
    }
    
    subscript(index: Int) -> T? {
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
    
    /// 释放ptr
    func releasePtr() {
        ptr.deinitialize(count: Int(capacity))
        ptr.deallocate()
    }
    
    
    var description: String {
        var desc = ""
        var element: T
        for i in 0 ..< size {
            element = ptr.advanced(by: i).pointee!
            desc += "\(element)"
            if i != size - 1 {
                desc += ", "
            }
        }
        return "[\(desc)]"
    }
}



