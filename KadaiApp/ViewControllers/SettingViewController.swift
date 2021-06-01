//
//  SettingViewController.swift
//  KadaiApp
//
//  Created by takatoshi.ichige on 2021/06/01.
//

import UIKit
import Firebase

class SettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedCreateDataButton(_ sender: Any) {
        let aleart = UIAlertController(title: "Firebase上にデータを作成いたします。", message: "よろしいでしょうか。", preferredStyle: .alert)
        aleart.addAction(UIAlertAction(title: "OK", style: .default, handler: { alertAction in
            print("OK")
        }))
        
        aleart.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(aleart, animated: true, completion: nil)
        
    }
    
    private func createData() {
        
    }
}
