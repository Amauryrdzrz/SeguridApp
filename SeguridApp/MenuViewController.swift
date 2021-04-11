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
    var token = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Entro")
        let menu = MenuController(with: ["Sensores", "Locaciones", "Ajustes"])
        menu.delegate = self
        
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapMenu(){
        present(sideMenu!, animated: true)
    }
    
    func didSelectMenuItem(named: String) {
        sideMenu?.dismiss(animated: true, completion: nil)
        
        if named == "Sensores" {
            
        }
        else if named == "Locaciones" {
            
        }
        else if named == "Ajustes" {
            
        }
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

protocol MenuControllerDelegate{
    func didSelectMenuItem(named:String)
}

class MenuController: UITableViewController {
    
    public var delegate: MenuControllerDelegate?
    
    private let menuItems: [String]
    
    init(with menuItems: [String]){
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        //tableView.register(UITableView.self, forCellReuseIdentifier: "cell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return menuItems.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
    }
}
