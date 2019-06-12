//
//  ViewController.swift
//  terminateTest
//
//  Created by mohsen khodadadzadeh on 6/12/19.
//  Copyright © 2019 mohsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var obsTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppDelegate.applicationObserver.addObserver("ViewController" as AnyObject, removeIfExist: true, options: [.destroy]) { (getString, getOption) in
            
            print("View1")
            do {
                let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                
                let addr = url.appendingPathComponent("1.txt")
                
                try "first ViewController".write(to: addr, atomically: true, encoding: .utf8)
            } catch {
                
            }
        }
        
        do {
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            
            let addr = url.appendingPathComponent("1.txt")
            
            obsTxt.text = try String.init(contentsOf: addr)
        } catch {
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    


}

