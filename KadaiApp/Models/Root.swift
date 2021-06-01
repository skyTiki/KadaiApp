//
//  Root.swift
//  KadaiApp
//
//  Created by takatoshi.ichige on 2021/06/01.
//

import Foundation

class Root{
    
    let id: String
    let name: String
    let date: Date
    let sections: [section]
    
    init(id: String, name: String, date: Date, sections: [section]) {
        self.id = id
        self.name = name
        self.date = date
        self.sections = sections
    }
}

class section {
    
    let startPoint: String
    let destinatination: String
    
    let scheduledStartTime: Date
    let scheduledEndTime: Date
    
    let startTime: Date
    let endTime: Date
    
    init(startPoint: String, destinatination: String, scheduledStartTime: Date, scheduledEndTime: Date, startTime: Date, endTime: Date) {
        self.startPoint = startPoint
        self.destinatination = destinatination
        self.scheduledStartTime = scheduledStartTime
        self.scheduledEndTime = scheduledEndTime
        self.startTime = startTime
        self.endTime = endTime
    }
}
