//
//  AlertViewController.swift
//  FirstApp
//
//  Created by Muhammed Thasneem on 13/07/17.
//  Copyright © 2017 Muhammed Thasneem. All rights reserved.
//

import UIKit

class AlertViewMController: UIViewController {

    @IBOutlet weak var photoImgeView: UIImageView!
    
    @IBOutlet weak var nameTexField: UITextField!
    @IBOutlet weak var numberTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addItemAction(_ sender: Any) {
    }
}
