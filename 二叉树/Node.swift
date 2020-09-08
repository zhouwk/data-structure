//
//  Node.swift
//  二叉树
//
//  Created by 周伟克 on 2020/9/7.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation



class Node {
    let value: String
    
    var lChild: Node?
    var rChild: Node?
    
    init(_ value: String) {
        self.value = value
    }
}
