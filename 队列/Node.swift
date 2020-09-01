//
//  Node.swift
//  队列
//
//  Created by 周伟克 on 2020/9/1.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation

class Node<T> {
    
    let value: T
    weak var prev: Node<T>?
    var next: Node<T>?
    
    init(_ value: T) {
        self.value = value
    }
    
}
