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
 
 Задание 
 
 Параметры вызова Web-сервиса:
 Для  передачи данных  используется протокол REST, HTTP запрос POST с указанием необходимых параметров. Ответ сервера на запрос возвращается в формате JSON в символьной кодировке Unicode.
 
 URL: http://mobile.atrinity.ru/api/service
 
 Для списка заявок
 ApiKey  String уникальный ключ e8e6a311d54985a067ece5a008da280a
 Login   String логин    d_blinov
 Password String         Passw0rd
 ObjectCode String код объекта 300
 Action String  действие над заявкой  GET_LIST
 Fields String  {field1: value1, field2:value2, ...} сериалезированный массив в формате JSON  
 Fields[FilterID]=3CD0E650-4B81-E511-A39A-1CC1DEAD694D 
 
 Для детальной информации по заявкам
 ApiKey  String уникальный ключ e8e6a311d54985a067ece5a008da280a
 Login   String логин    d_blinov
 Password String         Passw0rd
 ObjectCode String код объекта 300
 Action String  действие над заявкой  GET_INFO
 Fields String  {field1: value1, field2:value2, ...} сериалезированный массив в формате JSON
 Fields[RequestID]=<Значение поля RequestID, полученное при вызове метода GET_LIST>
 
 */


/* HTTP запросы 
 METHOD(метод запроса) URI(идентификатор ресурса) HTTP/VERSION(версия протокола) 
 

 
 */
