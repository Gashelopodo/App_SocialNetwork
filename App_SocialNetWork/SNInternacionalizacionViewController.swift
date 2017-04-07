//
//  SNInternacionalizacionViewController.swift
//  App_SocialNetWork
//
//  Created by cice on 31/3/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class SNInternacionalizacionViewController: UIViewController {
    
    
    //MARK: - Outlet
    

    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var moneda: UILabel!
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var apellido: UILabel!
    @IBOutlet weak var numero: UILabel!
    @IBOutlet weak var myImage: UILabel!
    
    @IBOutlet weak var imagen: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        dameValores()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        muestraVC()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: - UTILS
    
    func dameValores(){
        
        nombre.text = "Sergio"
        apellido.text = "Guti"
        fecha.text = "\(Date())"
        moneda.text = "\(9.999)"
        numero.text = "\(652222222)"
        imagen.image = UIImage(named: "hola.png")
        
    }
    
    func muestraVC(){
        
        present(muestraAlert(NSLocalizedString("TITLE_DATA", comment: ""), NSLocalizedString("MESSAGE_DATA", comment: ""), NSLocalizedString("GOOD_MORNING", comment: "")),animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
