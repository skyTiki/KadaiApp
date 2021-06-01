//
//  Root.swift
//  KadaiApp
//
//  Created by takatoshi.ichige on 2021/06/01.
//

import Foundation
import Firebase

class Root{
    
    let id: String
    let name: String?
    let date: Date?
    let sections: [Section]
    
    init(document: QueryDocumentSnapshot) {
        
        let rootDic = document.data()
        
        self.id = document.documentID
        self.name = rootDic["name"] as? String
        self.date = rootDic["date"] as? Date
        
        
        // 該当するSectionを取得する
        var sectionArray: [Section] = []
        Firestore.firestore().collection(Const.SectionPath).whereField("rootId", isEqualTo: document.documentID).getDocuments { (querySnapshot, eroor) in
            if let eroor = eroor {
                fatalError("sectionの取得に失敗しました。\(eroor.localizedDescription)")
            }
            
            var sections: [Section] = []
            for document in querySnapshot!.documents {
                let section = Section(document: document)
                sections.append(section)
            }
            
            sectionArray = sections
        }
        sections = sectionArray
    }
}

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
