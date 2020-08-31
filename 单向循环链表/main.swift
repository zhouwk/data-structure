//
//  main.swift
//  单项循环链表
//
//  Created by 周伟克 on 2020/8/28.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation



print("---------insert---------")
var list = LinkedList<Int>()
list.append(0)
list.append(1)
list.append(2)
list.append(3)
list.append(4)
print(list)


print("---------reverse---------")
list.reverse()
print(list)


print("---------delete---------")
list.delete(at: 0) // 1 2 3 4
list.delete(at: 3) // 1 2 3
list.delete(at: 2) // 1 2
list.delete(at: 0) // 2
list.delete(at: 0) // 空
print(list)




print("---------clear---------")
list.clear()

print("---------insert---------")
list.insert(0, at: 0)
list.insert(1, at: 0) // 1 0
list.insert(2, at: 2) // 1 0 2
list.insert(3, at: 1) // 1 3 0 2
print(list)

