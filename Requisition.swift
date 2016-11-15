//
//  PeopleReq.swift
//  Test
//
//  Created by Dmitriy on 28/10/2016.
//  Copyright © 2016 Dmitriy. All rights reserved.
//

import UIKit
import Foundation




struct Requisition {
    let requestNumber: Int?
    let name: String
    var createdAt: String
    
    init(requestNumber: Int, name: String) {
        
        self.requestNumber = requestNumber
        self.name = name
        self.createdAt = name

    }
    
}



//extension Requisition: CustomStringConvertible {
//    var description: String {
//        return "\(name): flickr.com/\(createdAt)"
//    }
//} 
/*

     request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
 

 
 */


/* HTTP запросы 
 METHOD(метод запроса) URI(идентификатор ресурса) HTTP/VERSION(версия протокола) 
 

 
 */
