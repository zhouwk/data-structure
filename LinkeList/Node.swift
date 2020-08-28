//
//  Node.swift
//  LinkeList
//
//  Created by 周伟克 on 2020/8/10.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation

class Node<T> {    
    let element: T
    var next: Node<T>? = nil
    
    var last: Node<T>? {
        var cursor: Node<T>? = self
        while cursor?.next != nil {
            if cursor?.next === self {  //避免环的出现导致死循环
                return cursor
            }
            cursor = cursor?.next
        }
        return cursor
    }
    
    
    init(element: T) {
        self.element = element
    }
    
}
