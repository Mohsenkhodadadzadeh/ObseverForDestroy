//
//  SecondViewController.swift
//  terminateTest
//
//  Created by mohsen khodadadzadeh on 6/12/19.
//  Copyright © 2019 mohsen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var obsTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        AppDelegate.applicationObserver.addObserver(self as AnyObject, removeIfExist: true, options: [.destroy]) { (getString, getOption) in
            print("View2")
            do {
                let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                
                let addr = url.appendingPathComponent("2.txt")
                
                try "Second ViewController".write(to: addr, atomically: true, encoding: .utf8)
            } catch {
                
            }
            
        }
        do {
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            
            let addr = url.appendingPathComponent("2.txt")
            
            obsTxt.text = try String.init(contentsOf: addr)
        } catch {
            
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
