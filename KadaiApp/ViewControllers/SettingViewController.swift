//
//  SettingViewController.swift
//  KadaiApp
//
//  Created by takatoshi.ichige on 2021/06/01.
//

import UIKit
import Firebase
import PKHUD

class SettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // データ作成ボタン押下
    @IBAction func tappedCreateDataButton(_ sender: Any) {
        let aleart = UIAlertController(title: "データベース上にデータを作成いたします。", message: "よろしいでしょうか。", preferredStyle: .alert)
        aleart.addAction(UIAlertAction(title: "OK", style: .default, handler: { alertAction in
            // アラートOKでデータ作成を行う
            HUD.show(.progress)
            self.createFirestoreData {
                HUD.flash(.success, delay: 1.5)
            }
        }))
        
        aleart.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(aleart, animated: true, completion: nil)
        
    }
    
    // Firestoreに投入するための擬似データの作成
    private func createFirestoreData(handler: @escaping() -> Void) {
        
        // 開始終端で使用する地点の配列
        let ekiList = ["池袋", "目白", "高田馬場", "新大久保", "新宿", "代々木", "原宿", "渋谷", "恵比寿", "目黒", "五反田", "大崎", "品川", "高輪ゲートウェイ", "田町", "浜松町", "新橋", "有楽町", "東京", "神田", "秋葉原", "御徒町", "上野", "鶯谷", "日暮里", "西日暮里", "田端", "駒込", "巣鴨", "大塚"]
        
        // ループでrootデータ作成
        for rootCount in 0...12 {
            
            let rootRef = Firestore.firestore().collection(Const.RootPath).document()
            
            var date = Calendar.current.startOfDay(for: Date())
            
            // ループでセクション作成
            for sectionCount in 0...12 {
                
                let sectionRef = Firestore.firestore().collection(Const.SectionPath).document()
                
                let randomEkiListNumber = Int.random(in: 0...27)
                
                let randomDateNumber = Int.random(in: 20...50)
                
                let startDate = Calendar.current.date(byAdding: .minute, value: sectionCount + randomDateNumber, to: date)!
                let endDate = Calendar.current.date(byAdding: .minute, value: sectionCount + randomDateNumber, to: startDate)!
                date = endDate
                
                
                let sectionDic: [String : Any] = [
                    "rootId" : rootRef.documentID,
                    "startPoint" : ekiList[randomEkiListNumber],
                    "destinatination" : ekiList[randomEkiListNumber+1],
                    "scheduledStartTime" : startDate,
                    "scheduledEndTime" : endDate,
                    "startTime" : startDate,
                    "endTime": endDate
                ]
                
                sectionRef.setData(sectionDic)
                
            }
            
            let rootDic: [String : Any] = [
                "name" : "行路No.\(rootCount + 1)",
                "date": Date()
            ]
            
            rootRef.setData(rootDic)
            
        }
        DispatchQueue.main.async {
            handler()
        }
    }
}
