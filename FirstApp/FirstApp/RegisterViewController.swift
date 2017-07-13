//
//  RegisterViewController.swift
//  FirstApp
//
//  Created by Muhammed Thasneem on 13/07/17.
//  Copyright © 2017 Muhammed Thasneem. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func registerAction(_ sender: Any) {
        let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let user  = User(context: context)
        
        user.name = name.text
        user.email = email.text
        user.username = username.text
        user.password = password.text
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        showSuccesDialog()
        
        
    }
    
    
    func showSuccesDialog() {
        let uiAlert = UIAlertController(title: "Info", message: "Successfully saved", preferredStyle: .alert)
        
        let uiActionOK = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            uiAlert.dismiss(animated: true, completion: nil)
            self.backAction("")
        }
        
        uiAlert.addAction(uiActionOK)
        self.present(uiAlert, animated: true, completion: nil)
        
    }

}
