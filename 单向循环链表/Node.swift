//
//  Node.swift
//  单项循环链表
//
//  Created by 周伟克 on 2020/8/28.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation


class Node<T> {
    
    let value: T
    var next: Node<T>?
    
    init(_ value: T) {
        self.value = value
    }
    
    
    deinit {
//        print(value, "deinit")
    }
}
