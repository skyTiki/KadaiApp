//
//  DetailViewController.swift
//  KadaiApp
//
//  Created by takatoshi.ichige on 2021/05/31.
//

import UIKit

class DetailViewController: UIViewController {
    
    var section: Section?
    
    // MARK: - Outlet接続
    @IBOutlet weak var scrollViewScheduledStartTimeLabel: UILabel!
    @IBOutlet weak var scrollViewScheduledEndTimeLabel: UILabel!
    @IBOutlet weak var scrollViewStartTimeLabel: UILabel!
    @IBOutlet weak var scrollViewEndTimeLabel: UILabel!
    
    @IBOutlet weak var startPointLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var detailViewScheduledStartTimeLabel: UILabel!
    @IBOutlet weak var detailViewScheduledEndTimeLabel: UILabel!
    @IBOutlet weak var detailViewStartTimeLabel: UILabel!
    @IBOutlet weak var detailViewEndTimeLabel: UILabel!
    
    
    var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "H:mm"
        return formatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDetailData()
    }
    
    func setDetailData() {
        
        guard let section = section else { return }
        
        // スクロールアニメーション部分のView
        scrollViewScheduledStartTimeLabel.text = "\(formatter.string(from: section.scheduledStartTime!)) (予定)"
        scrollViewScheduledEndTimeLabel.text = "\(formatter.string(from: section.scheduledEndTime!)) (予定)"
        scrollViewStartTimeLabel.text = "\(formatter.string(from: section.startTime!)) (実績)"
        scrollViewEndTimeLabel.text = "\(formatter.string(from: section.endTime!)) (実績)"
        
        // 詳細表示部分のView
        startPointLabel.text = section.startPoint!
        destinationLabel.text = section.destinatination!
        detailViewScheduledStartTimeLabel.text = formatter.string(from: section.scheduledStartTime!)
        detailViewScheduledEndTimeLabel.text = formatter.string(from: section.scheduledEndTime!)
        detailViewStartTimeLabel.text = formatter.string(from: section.startTime!)
        detailViewEndTimeLabel.text = formatter.string(from: section.endTime!)
        
        
    }
    
}
