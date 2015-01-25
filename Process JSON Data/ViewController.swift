//
//  ViewController.swift
//  Process JSON Data
//
//  Created by Yosemite on 1/24/15.
//  Copyright (c) 2015 Yosemite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlPath = "http://www.telize.com/geoip"
        var url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: { (webData, webResponse, webError) -> Void in
            if (webError != nil) {
                println(webError)
            } else {
                var jsonError:NSError?
                // NSJSONSerialization class to convert JSON to Foundation objects and convert Foundation objects to JSON
                let jsonResult = NSJSONSerialization.JSONObjectWithData(webData, options: NSJSONReadingOptions.MutableContainers, error: &jsonError) as NSDictionary
                
                println(webData)
                println(jsonResult)
                println(jsonResult["ip"]!)
            }
        })
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

