//
//  Node.swift
//  搜索二叉树
//
//  Created by 周伟克 on 2020/9/4.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation

class Node<T: Comparable> {
    var value: T
    weak var parent: Node<T>?
    var left: Node<T>?
    var right: Node<T>?
    
    
    init(_ value: T) {
        self.value = value
    }
}
