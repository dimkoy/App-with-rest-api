//
//  ViewController.swift
//  Test
//
//  Created by Dmitriy on 28/10/2016.
//  Copyright © 2016 Dmitriy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //Detail information 
  
    
    @IBOutlet weak var tableView: UITableView!
    
    let requisition = [
        Requisition(requestNumber: 1, name: "girl"), //createdAt: "10.10.16"),
        Requisition(requestNumber: 2, name: "secnd"), //createdAt: "10.10.16"),
        Requisition(requestNumber: 3, name: "thrid") //createdAt: "10.10.16"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        
        
        // Get #1 app name using SwiftyJSON
        DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
            let json = JSON(data: data)
            if let appName = json["feed"]["entry"][0]["im:name"]["label"].string {
                print("SwiftyJSON: \(appName)")
            }
        }
        
        // Get the #1 app name from iTunes and SwiftyJSON
        DataManager.getTopAppsDataFromItunesWithSuccess { (iTunesData) -> Void in
            let json = JSON(data: iTunesData)
            if let appName = json["feed"]["entry"][0]["im:name"]["label"].string {
                print("NSURLSession: \(appName)")
            }
            //            //1
            //            if let appArray = json["feed"]["entry"].array {
            //                //2
            //                var apps = [AppModel]()
            //
            //                //3
            //                for appDict in appArray {
            //                    let appName: String? = appDict["im:name"]["label"].string
            //                    let appURL: String? = appDict["im:image"][0]["label"].string
            //
            //                    let app = AppModel(name: appName, appStoreURL: appURL)
            //                    apps.append(app)
            //                }
            //                
            //                //4
            //                print(apps)
            //            }

        
        
        
        
        
        
        
        }
    }

   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
    
    
    let requisitions = requisition[1]
    cell.textLabel?.text = String(describing: requisitions.requestNumber)
    cell.detailTextLabel?.text = requisitions.name + " " + requisitions.createdAt
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You select\(requisition[1])")
    }
    
}


