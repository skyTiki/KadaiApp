//
//  DetailListViewController.swift
//  KadaiApp
//
//  Created by takatoshi.ichige on 2021/05/31.
//

import UIKit
import Firebase

class DetailListViewController: UIViewController {
    
    @IBOutlet weak var detailTableView: UITableView!
    
    var sectionArray: [Section] = []
    // 前画面から設定された際に、セクションの取得を行う
    var root: Root? {
        didSet {
            if let root = root {
                // ルートIDと一致するもののみ取得する
                Firestore.firestore().collection(Const.SectionPath).whereField("rootId", isEqualTo: root.id).getDocuments { (querySnapshot, error) in
                    if let error = error { fatalError("sectionの取得に失敗しました。 \(error.localizedDescription)") }
                    
                    for document in querySnapshot!.documents {
                        let section = Section(document: document)
                        self.sectionArray.append(section)
                    }
                    
                    self.detailTableView.reloadData()
                    
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // tableViewの選択状態解除
        if let onSelectIndexPath = detailTableView.indexPathForSelectedRow {
            detailTableView.deselectRow(at: onSelectIndexPath, animated: false)
        }
    }
}

extension DetailListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        
        let section = sectionArray[indexPath.row]
        cell.textLabel?.text = "\(section.startPoint!) ~ \(section.destinatination!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailStroryboard = UIStoryboard(name: "Detail", bundle: nil)
        let detailViewController = detailStroryboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        // ナビゲーションバーのタイトルに設定
        detailViewController.navigationItem.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
