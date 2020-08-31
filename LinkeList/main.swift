//
//  main.swift
//  LinkeList
//
//  Created by 周伟克 on 2020/8/10.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation

var list = LinkedList<Int>()


print("---------append---------")
list.apend(0)
list.apend(1)
print(list)

print("---------insert---------")
list.clear()
list.insert(0, at: 0)
list.insert(1, at: 1)
list.insert(2, at: 0)
list.insert(3, at: 1)
list.insert(5, at: 4)
print(list)


print("---------reverse---------")
list.reverse()
print(list)

print("---------delete---------")
list.clear()
for value in 0 ... 5 {
    list.apend(value)
}
/// 0 1 2 3 4 5
list.delete(at: 0)
list.delete(at: 4)
list.delete(at: 2)
list.delete(at: 2)
list.delete(at: 0)
list.delete(at: 0)
print(list)


print("---------删除重复元素---------")
list.clear()
list.apend(1)
list.apend(0)
list.apend(3)
list.apend(0)
list.apend(0)
list.apend(2)
list.deleteValue(0)
print(list)
print(list.head?.value)
print(list.tail?.value)


print("---------是否有环---------")
print(list.containsLoop())
list.tail?.next = list.head
print(list.containsLoop())









