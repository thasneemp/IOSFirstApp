//
//  ViewController.swift
//  FirstApp
//
//  Created by Muhammed Thasneem on 12/07/17.
//  Copyright © 2017 Muhammed Thasneem. All rights reserved.
//

import UIKit

import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.green.cgColor
        usernameTextField.attributedPlaceholder = getColor(value: "Username")
        passwordTextField.attributedPlaceholder = getColor(value: "Password")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func registerAction(_ sender: Any) {
        
        performSegue(withIdentifier: "registerPage", sender: self)
    }

    @IBAction func loginAction(_ sender: Any) {
        
      
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"User")
        fetchRequest.fetchLimit = 1
        
        let predicate = NSPredicate(format: "username == %@ AND password == %@", usernameTextField.text!, passwordTextField.text!)
        fetchRequest.predicate = predicate
        
        do {
            let result = try context.fetch(fetchRequest)
//            for items in result {
//                let data = items.value(forKey: "name") as! String
//                print(data)
//            }
            
            if result.count>0 {
                performSegue(withIdentifier: "navigationView", sender: self)
            }else{
                showAlert()
            }
        } catch  {
            print("Error proned")
        }
        
        
        
        
//        if usernameTextField.text == "muhammed" && passwordTextField.text == "muhammed"{
//            
//            performSegue(withIdentifier: "navigationView", sender: self)
//            
//        }else{
//            showAlert()
//        }
//        
        
    }
    func getColor(value:String) -> NSAttributedString {
        let clorName = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        let color = NSAttributedString(string:value, attributes:[NSForegroundColorAttributeName:clorName])
        return color
    }
    
    
    func showAlert()  {
        let alert = UIAlertController(title: "Prompt", message: "Invalid username or password!", preferredStyle: UIAlertControllerStyle.alert)
        
        let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (Action) in
            
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
}

