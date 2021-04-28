//
//  HomeViewController.swift
//  SeguridApp
//
//  Created by Marcos Amaury Rodríguez Ruiz on 11/04/21.
//

import UIKit

class HomeViewController: UIViewController {

    var token = ""
    
    @IBAction func homeBtn(_ sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        if token ==  "=i123euu901900409ujjifwiwai"{
            self.performSegue(withIdentifier: "token", sender: nil)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is MenuViewController{
            let vc = segue.destination as? MenuViewController
            vc?.token = token
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
