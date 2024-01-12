//
//  ViewController.swift
//  Mallikharjun
//
//  Created by Apple on 11/01/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mallikharjuna: UILabel!
    var qualification:String = ""
    var someobj:Someobject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        someobj = Someobject()
        
        
        // Do any additional setup after loading the view.
    }
    deinit{
       
        print("viewController deinitalized")
    }
    
    
    
    
}

class Someobject {
    
    init() {
        print("Someobject initalized")
    }
    
    deinit {
        print("SomeObject Deinitalized")
    }
}



