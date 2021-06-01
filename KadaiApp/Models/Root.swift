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
    
    init(document: QueryDocumentSnapshot) {
        
        let rootDic = document.data()
        
        self.id = document.documentID
        self.name = rootDic["name"] as? String
        self.date = rootDic["date"] as? Date
    }
}
