//
//  main.swift
//  双端队列
//
//  Created by 周伟克 on 2020/9/3.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation



let queue = Queue<Int>()
queue.enQueueAtHead(0) // 0
queue.enQueueAtHead(1) // 1 0
queue.enQueueAtHead(2) // 2 1 0
queue.enQueueAtTail(3) // 2 1 0 3
queue.enQueueAtTail(4) // 2 1 0 3 4
queue.deQueueAtHead() //  1 0 3 4
queue.deQueueAtTail() //  1 0 3
queue.deQueueAtHead() //  0 3
queue.deQueueAtTail() //  0
queue.deQueueAtTail()
print(queue)
print(queue.head)
print(queue.tail)
print(queue.size)
