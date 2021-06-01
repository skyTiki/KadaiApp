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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDetailData()
    }
    
    func setDetailData() {
        
        guard let section = section else { return }
        
        // スクロールアニメーション部分のView
        scrollViewScheduledStartTimeLabel.text = "\(section.getFormatDate(date: section.scheduledStartTime!)) (予定)"
        scrollViewScheduledEndTimeLabel.text = "\(section.getFormatDate(date: section.scheduledEndTime!)) (予定)"
        scrollViewStartTimeLabel.text = "\(section.getFormatDate(date: section.startTime!)) (実績)"
        scrollViewEndTimeLabel.text = "\(section.getFormatDate(date: section.endTime!)) (実績)"
        
        // 詳細表示部分のView
        startPointLabel.text = section.startPoint!
        destinationLabel.text = section.destinatination!
        detailViewScheduledStartTimeLabel.text = section.getFormatDate(date: section.scheduledStartTime!)
        detailViewScheduledEndTimeLabel.text = section.getFormatDate(date: section.scheduledEndTime!)
        detailViewStartTimeLabel.text = section.getFormatDate(date: section.startTime!)
        detailViewEndTimeLabel.text = section.getFormatDate(date: section.endTime!)
        
        
    }
    
}
