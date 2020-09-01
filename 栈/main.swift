//
//  main.swift
//  栈
//
//  Created by 周伟克 on 2020/9/1.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation


let bracketMap: [Character: Character] = [")": "(", "]": "[", "}": "{"]
let rights = bracketMap.keys
let lefts = bracketMap.values

func testBrackts(in source: String) -> Bool {
    let stack = Stack<Character>()
    for c in source {
        if lefts.contains(c) {
            stack.push(c)
        } else if rights.contains(c) {
            if stack.top == bracketMap[c] {
                _ = stack.pop()
            } else {
                return false
            }
        }
    }
    return stack.top == nil
}

print(testBrackts(in: "]{{{{{{}}}}}}"))


