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
        self.scheduledStartTime = document["scheduledStartTime"] as? Date
        self.scheduledEndTime = document["scheduledEndTime"] as? Date
        self.startTime = document["startTime"] as? Date
        self.endTime = document["endTime"] as? Date
    }
}
