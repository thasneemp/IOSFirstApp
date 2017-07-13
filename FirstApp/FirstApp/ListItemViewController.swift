//
//  ListItemViewController.swift
//  FirstApp
//
//  Created by Muhammed Thasneem on 12/07/17.
//  Copyright © 2017 Muhammed Thasneem. All rights reserved.
//

import UIKit

class ListItemViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var emptyView: UILabel!
    
    @IBOutlet weak var cTableView: UITableView!
    var contact = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadSampleDatat()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contact.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath)as? ContactTableViewCell else{
            fatalError("Error proned")
        }
        
        let address = contact[indexPath.row]
        
        cell.nameLable.text = address.name
        cell.phoneNumberLabel.text = address.number
        cell.photoImageView.image = address.photo
        
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertView = UIAlertController(title: (contact[indexPath.row].name) , message: "Are you sure you want to delete?", preferredStyle: UIAlertControllerStyle.alert)
        
        let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (ActionDo) in
            
        
//            self.updateToTable(contact : self.contact[indexPath.row])
            
            self.deleteRow(indexPath: indexPath)
            alertView.dismiss(animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        
//        alertView.addTextField { (textfFiled :UITextField) in
//            textfFiled.placeholder  = "Enter your name"
//        }
        alertView.addAction(alertAction)
        alertView.addAction(cancelAction)
        self.present(alertView, animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func deleteRow(indexPath : IndexPath)  {
        self.contact.remove(at: indexPath.row)
        self.cTableView.beginUpdates()
    self.cTableView.deleteRows(at: [indexPath], with: .fade)
        self.cTableView.endUpdates()
        
        if self.contact.count<=0 {
            emptyView.isHidden = false
        }
    }
    
    func updateToTable(contact : Contact)  {
        self.contact+=[contact]
        
        self.cTableView.beginUpdates()
        let indexPaths:IndexPath = IndexPath(row:(self.contact.count - 1), section:0)
        
        self.cTableView.insertRows(at: [indexPaths], with: UITableViewRowAnimation.fade)
        self.cTableView.endUpdates()
        self.cTableView.scrollToRow(at: indexPaths, at: .bottom, animated: true)
    }
    
    func loadSampleDatat() {
        let photo1 = UIImage(named:"meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
        
        guard let contact1 = Contact(name:"Muhammed", photo:photo1,number:"8086461927") else {
            fatalError("canot insatntiate")
        }
        
        guard let contact2 = Contact(name:"Muneer", photo:photo2,number:"8086461927") else {
            fatalError("canot insatntiate")
        }
        guard let contact3 = Contact(name:"Nasar", photo:photo3,number:"8086461927") else {
            fatalError("canot insatntiate")
        }
        
        contact+=[contact1,contact2,contact3,contact1]
    }

}
