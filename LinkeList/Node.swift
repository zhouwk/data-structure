//
//  Node.swift
//  LinkeList
//
//  Created by 周伟克 on 2020/8/10.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation

class Node<T> {    
    let value: T
    var next: Node<T>? = nil
    
    init(_ value: T) {
        self.value = value
    }
    
    deinit {
        print(value, "deinit")
    }
}
