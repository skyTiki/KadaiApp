//
//  Section.swift
//  KadaiApp
//
//  Created by takatoshi.ichige on 2021/06/01.
//

import Foundation
import Firebase

class Section {
    
    let id: String
    let rootId: String
    
    var startPoint: String?
    var destinatination: String?
    
    var scheduledStartTime: Date?
    var scheduledEndTime: Date?
    
    var startTime: Date?
    var endTime: Date?
    
    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID
        self.rootId = document["rootId"] as! String
        self.startPoint = document["startPoint"] as? String
        self.destinatination = document["destinatination"] as? String
        
        self.scheduledStartTime = (document["scheduledStartTime"] as!Timestamp).dateValue()
        self.scheduledEndTime = (document["scheduledEndTime"] as! Timestamp).dateValue()
        self.startTime = (document["startTime"] as! Timestamp).dateValue()
        self.endTime = (document["endTime"] as! Timestamp).dateValue()

    }
    
    init(id: String, rootId: String, startPoint: String? = nil, destinatination: String? = nil, scheduledStartTime: Date? = nil, scheduledEndTime: Date? = nil, startTime: Date? = nil, endTime: Date? = nil) {
        self.id = id
        self.rootId = rootId
        self.startPoint = startPoint
        self.destinatination = destinatination
        self.scheduledStartTime = scheduledStartTime
        self.scheduledEndTime = scheduledEndTime
        self.startTime = startTime
        self.endTime = endTime
    }
}
