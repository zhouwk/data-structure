//
//  main.swift
//  LinkeList
//
//  Created by 周伟克 on 2020/8/10.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation

let list = LinkedList<Int>()
list.appendNode(0)

let nodeA = Node(element: 1)
let nodeB = Node(element: 2)
let nodeC = Node(element: 3)

nodeA.next = nodeB
nodeB.next = nodeC

list.insertNode(nodeA, at: 1)

nodeC.next = nodeA

print(list.containsLoop())



