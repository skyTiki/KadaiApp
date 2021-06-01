//
//  ViewController.swift
//  KadaiApp
//
//  Created by takatoshi.ichige on 2021/05/31.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    var rootArray: [Root] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchFirebase()
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // tableViewの選択状態解除
        if let onSelectIndexPath = listTableView.indexPathForSelectedRow {
            listTableView.deselectRow(at: onSelectIndexPath, animated: false)
        }
    }
    
    
    private func fetchFirebase() {
        
        Firestore.firestore().collection(Const.RootPath).order(by: "date").getDocuments { (querySnapshot, error) in
            if let error = error { fatalError("rootデータの取得で失敗しました。\(error.localizedDescription)") }
            
            for document in querySnapshot!.documents {
                let root = Root(document: document)
                self.rootArray.append(root)
            }
            
            self.listTableView.reloadData()
        }
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rootArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        cell.textLabel?.text = rootArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailStoryboard = UIStoryboard(name: "DetailList", bundle: nil)
        let viewController = detailStoryboard.instantiateViewController(identifier: "DetailListViewController") as! DetailListViewController
        
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
}
