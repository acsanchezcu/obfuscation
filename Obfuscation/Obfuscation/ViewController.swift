//
//  ViewController.swift
//  Obfuscation
//
//  Created by Abel Sánchez Custodio on 15/11/16.
//  Copyright © 2016 acsanchezcu. All rights reserved.
//

import UIKit
import Alamofire
import Obfuscator


class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = ObfuscationManager.sharedInstance.getString(key: Keys.userId)
    }
    
    @IBAction func userDidTapSendWSButton(_ sender: Any) {
        let url_string = ObfuscationManager.sharedInstance.getString(key: Urls.urlAlamofire)
        Alamofire.request(url_string).responseJSON { response in
            print(response.request!)  // original URL request
            print(response.response!) // HTTP URL response
            print(response.data!)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
}

