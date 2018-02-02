//
//  ViewController.swift
//  ReuseIdentifierInterface_Test
//
//  Created by Andres Felipe Ocampo Eljaiesk on 2/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Test"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        /**
         -> Registro de la celda
         Aqui es donde normalmente se usa entre "" el nombre del .xib y le asignamos un nombre del celda para reutilizar
        
         1. Pues con esta interfaz publica que me sirve no solo de Celdas sino Controladores
         obtenemos el nombre exacto de la UIView y excluye ".swift" y nos olvidamos
         de nombres inventados
        **/
        tableView.register(UINib(nibName: CustomCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: CustomCell.defaultReuseIdentifier)
    }
    
    //MARK: - Method Delegate - DataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 1
        }
       
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.defaultReuseIdentifier, for: indexPath) as! CustomCell
            cell.myAceptarButton.addTarget(self,
                                           action: #selector(showAlert),
                                           for: .touchUpInside)
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 195
        default:
            return 60
        }
    }
    
    @objc func showAlert(){
        let alertVC = UIAlertController(title: "Test",
                                        message: "test", preferredStyle: .alert)
        
        alertVC.addAction(UIAlertAction(title: "OK",
                                        style: .default,
                                        handler: nil))
        
        present(alertVC,
                animated: true,
                completion: nil)
    }
    
    
    

}

