//
//  AddToDoViewController.swift
//  iOSHandOn
//
//  Created by kyohei.minami on 2017/12/26.
//  Copyright © 2017年 handson. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    @IBOutlet weak var todoTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        todoTextView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension AddToDoViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            // Entityにデータを格納
            ToDoListEntity.shared.appendToDo(todo: textView.text)
            // キーボードを閉じる
            textView.resignFirstResponder()
            // 前の画面へ戻る
            navigationController?.popViewController(animated: true)
            return false
        }
        
        return true
    }
    
}
