//
//  ViewController.swift
//  SeguridApp
//
//  Created by Marcos Amaury Rodríguez Ruiz on 10/04/21.
//
import SideMenu
import UIKit

class MenuViewController: UIViewController, MenuControllerDelegate{
    
    private var sideMenu: SideMenuNavigationController?
    private let AjustesController = AjustesViewController()
    private let SensoresController = SensoresViewController()
    private let LocacionesController = LocacionesViewController()
    
    var token = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Entro")
        let menu = MenuController(with: ["SeguridApp","Sensores", "Locaciones", "Ajustes"])
        menu.delegate = self
        
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        // Do any additional setup after loading the view.
        addChildControllers()
    }

    private func addChildControllers(){
        addChild(AjustesController)
        addChild(LocacionesController)
        addChild(SensoresController)
        
        view.addSubview(AjustesController.view)
        view.addSubview(LocacionesController.view)
        view.addSubview(SensoresController.view)
        AjustesController.view.frame = view.bounds
        LocacionesController.view.frame = view.bounds
        SensoresController.view.frame = view.bounds
        
        AjustesController.didMove(toParent: self)
        LocacionesController.didMove(toParent: self)
        SensoresController.didMove(toParent: self)
        
        AjustesController.view.isHidden = true
        LocacionesController.view.isHidden = true
        SensoresController.view.isHidden = true
        
    }

    @IBAction func didTapMenu(){
        present(sideMenu!, animated: true)
    }
    
    
    func didSelectMenuItem(named: String) {
        sideMenu?.dismiss(animated: true, completion: {
        
            self.title = named
            if named == "SeguridApp" {
            }
            else if named == "Sensores" {
                self.performSegue(withIdentifier: "Sensores", sender: nil)
            }
            else if named == "Locaciones" {
                self.performSegue(withIdentifier: "Locaciones", sender: nil)
            }
            else if named == "Ajustes" {
                self.performSegue(withIdentifier: "Ajustes", sender: nil)            }
            
        })
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

