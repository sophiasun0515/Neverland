//
//  RoleSelectionViewController.swift
//  Neverland
//
//  Created by Apple on 1/27/18.
//  Copyright © 2018 League of Sophistication. All rights reserved.
//

import UIKit

class RoleSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func Start_Chat(_ sender: Any) {
    }
    @IBOutlet weak var Role_1: UIImageView!
    
    @IBOutlet weak var Name_1: UILabel!
    
    @IBOutlet weak var Desc_1: UITextView!
    
    @IBOutlet weak var Role_2: UIImageView!
    
    @IBOutlet weak var Name_2: UILabel!
    
    @IBOutlet weak var Desc_2: UITextView!
    
    
    @IBOutlet weak var Role_3: UIImageView!
    
    @IBOutlet weak var Name_3: UILabel!
    
    @IBOutlet weak var Desc_3: UITextView!
    
}
