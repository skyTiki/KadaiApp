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
    
    @IBOutlet weak var nowKiroteiLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var estimateSpeedLabel: UILabel!
    
    @IBOutlet weak var startPointLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var detailViewScheduledStartTimeLabel: UILabel!
    @IBOutlet weak var detailViewScheduledEndTimeLabel: UILabel!
    @IBOutlet weak var detailViewStartTimeLabel: UILabel!
    @IBOutlet weak var detailViewEndTimeLabel: UILabel!
    
    // アイコン移動で使用する接続
    @IBOutlet weak var bicycleLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var startPointIconSizeConstraint: NSLayoutConstraint!
    @IBOutlet weak var startPointIconLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var destinationIconTrailingConstraint: NSLayoutConstraint!
    
    var bicycleMovingDistance: CGFloat = 0
    var bicycleIconSize: CGFloat = 0
    var destinationIconSize: CGFloat = 0
    
    var firstPlayTap = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDetailData()
        
        bicycleIconSize = startPointIconSizeConstraint.constant * 2.6
        destinationIconSize = startPointIconSizeConstraint.constant * 2

        // 移動距離算出
        bicycleMovingDistance = UIScreen.main.bounds.size.width - (startPointIconLeadingConstraint.constant + startPointIconSizeConstraint.constant + bicycleLeadingConstraint.constant + bicycleIconSize + destinationIconSize + destinationIconTrailingConstraint.constant)
        
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
    @IBAction func tappedPlayMoveButton(_ sender: Any) {
        
        if firstPlayTap {
            
            firstPlayTap = false
            
            var kirotei = 0
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (repeatedTimer) in
                
                if self.bicycleLeadingConstraint.constant >= self.bicycleMovingDistance {
                    repeatedTimer.invalidate()
                }
                
                self.bicycleLeadingConstraint.constant += 3
//                
                // 値修正
                kirotei += 1
                self.nowKiroteiLabel.text = "\(kirotei)km"
                
                let speed = Int.random(in: 150...230)
                self.speedLabel.text = "\(speed)km/h"
                
                let estimatedSpeedRange = Int.random(in: 0...30)
                self.estimateSpeedLabel.text = "\(speed + estimatedSpeedRange)km/h"
            })
        }
    }
}
