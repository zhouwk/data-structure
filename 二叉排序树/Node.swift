//
//  Node.swift
//  二叉树
//
//  Created by 周伟克 on 2020/9/7.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation

enum ChildType {
    case left
    case right
}


class Node<T: Comparable> {
    var value: T
    
    var lChild: Node<T>?
    var rChild: Node<T>?
    
    init(_ value: T) {
        self.value = value
    }
    
    
    var childCount: Int {
        var count = 0
        if lChild != nil {
            count += 1
        }

        if rChild != nil {
            count += 1
        }
        return count
    }
}


extension Node {
    var hasLChild: Bool { lChild != nil }
    var hasRChild: Bool { rChild != nil }
    var hasChild: Bool { hasLChild || hasRChild }
}
