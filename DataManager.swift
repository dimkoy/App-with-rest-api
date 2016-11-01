//
//  DataManager.swift
//  TopApps
//
//  Created by Dani Arnaout on 9/2/14.
//  Edited by Eric Cerney on 9/27/14.
//  Copyright (c) 2014 Ray Wenderlich All rights reserved.
//  Updated by SwiftBook.ru 24/11/2015

import Foundation

let TopAppURL = "http://mobile.atrinity.ru/api/service"

class DataManager {
    
    
    class func getTopAppsDataFromItunesWithSuccess(_ success: @escaping ((_ iTunesData: Data) -> Void)) {
        //1
        loadDataFromURL( NSURL(string: TopAppURL)! as URL, completion:{(data, error) -> Void in
            //2
            if let urlData = data {
                //3
                success(urlData)
            }
        })
    }
    
    
    class func getTopAppsDataFromFileWithSuccess(_ success: @escaping ((_ data: Data) -> Void)) {
        //1
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default).async(execute: {
            //2
            let filePath = Bundle.main.path(forResource: "TopApps",ofType:"json")
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: filePath!),
                                    options: NSData.ReadingOptions.uncached)
                success(data)
            } catch let error as NSError {
                print("error: \(error.localizedDescription)")
            } catch {
                fatalError()
            }
        })
    }
    
    
    public class func loadDataFromURL(_ url: URL, completion:@escaping (_ data: Data?, _ error: NSError?) -> Void) {
        let session = URLSession.shared
        
        let loadDataTask = session.dataTask(with: url as URL) { (data, response, error) -> Void in
            if let responseError = error {
                completion(nil, responseError as NSError?)
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    let statusError = NSError(domain:"com.raywenderlich", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(nil, statusError)
                } else {
                    completion(data, nil)
                }
            }
        }
        
        loadDataTask.resume()
    }
    
    
//    class func loadDataFromURL(_ url: URL, completion:@escaping (_ data: Data?, _ error: NSError?) -> Void) {
//        let session = URLSession.shared
//        
//        // Use NSURLSession to get data from an NSURL
//        let loadDataTask = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: NSError?) -> Void in
//            if let responseError = error {
//                completion(nil, responseError)
//            } else if let httpResponse = response as? HTTPURLResponse {
//                if httpResponse.statusCode != 200 {
//                    let statusError = NSError(domain:"com.raywenderlich", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
//                    completion(nil, statusError)
//                } else {
//                    completion(data, nil)
//                }
//            }
//            } as! (Data?, URLResponse?, Error?) -> Void)
//        
//        loadDataTask.resume()
//    }
}
