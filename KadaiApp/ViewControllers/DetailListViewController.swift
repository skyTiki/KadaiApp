//
//  DetailListViewController.swift
//  KadaiApp
//
//  Created by takatoshi.ichige on 2021/05/31.
//

import UIKit

class DetailListViewController: UIViewController {
    
    @IBOutlet weak var detailTableView: UITableView!
    
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        cell.textLabel?.text = "東京駅〜勤務地"
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
