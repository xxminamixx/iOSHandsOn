//
//  ToDoListEntity.swift
//  iOSHandOn
//
//  Created by kyohei.minami on 2017/12/26.
//  Copyright © 2017年 handson. All rights reserved.
//

import UIKit

final class ToDoListEntity: NSObject {
    
    /// 配列に格納されている順序とTableViewのindexPathは対応しているものとする

    static let shared = ToDoListEntity()
    // TODOを格納する配列
    private var todolist: Array<String>? = []

    // 外部からのinsertインタフェース
    func appendToDo(todo: String) {
        todolist?.append(todo)
    }
    
    // 外部からのdeleteインタフェース
    func deleteTodo(row: Int) {
        todolist?.remove(at: row)
    }
    
    // TODO配列の長さを返す
    func todoCount() -> Int {
        return todolist?.count ?? 0
    }
    
    // 指定したindexの文字列を返す
    func todoPick(row: Int) -> String {
        return todolist?[row] ?? ""
    }
    
}
