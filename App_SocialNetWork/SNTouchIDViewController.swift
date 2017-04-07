//
//  SNTouchIDViewController.swift
//  App_SocialNetWork
//
//  Created by cice on 31/3/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit
import LocalAuthentication

class SNTouchIDViewController: UIViewController {
    
    
    //MARK: - VARiables
    
    var customTouchID = LAContext()
    var messageData = "NEcesito saber si eres tú"
    var nombre = "Sergio"
    
    
    var alertVC = UIAlertController(title: "", message: "", preferredStyle: .alert)
    var alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    
    
    
    
    
    //MARK: - OUTLET
    
    @IBOutlet weak var momento: UILabel!
    @IBOutlet weak var comentario: UILabel!
    
    
    
    
    
    
    //MARK: - Action
    
    @IBAction func desbloqueoTouchIDAction(_ sender: Any) {
        
        momento.text = "Autenticado"
        var touchError : NSError?
        
        if customTouchID.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &touchError){
            
            customTouchID.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: messageData, reply: { (exitoso, errorTouch) in
                
                if exitoso{
                    self.momento.text = "TouchID exitoso"
                    self.comentario.text = "Has logrado demostrar que eres tú"
                    self.alertVC.title = "Autentificación exitosa"
                    self.alertVC.message = "Se que eres tu \(self.nombre)"
                    //pickerPhoto()
                }else{
                    self.momento.text = "TouchID no exitoso"
                    self.comentario.text = "NO has logrado demostrar que eres tú"
                    self.alertVC.title = "Autentificación fallida"
                    
                    
                    switch errorTouch!._code{
                        
                    case LAError.authenticationFailed.rawValue:
                        self.alertVC.message = "Fallo en la autenticación"
                    case LAError.userCancel.rawValue:
                        self.alertVC.message = "Usuario Ha cancelado la autenticación"
                    case LAError.systemCancel.rawValue:
                        self.alertVC.message = "Sistema Ha cancelado la autenticación"
                    case LAError.userFallback.rawValue:
                        self.alertVC.message = "Solicito que uses la contraseña"
                    default:
                        self.alertVC.message = "Algo salió mal"
                        
                    }
                    
                    self.present(self.alertVC, animated: true, completion: {
                        self.comentario.text = self.messageData
                    })
                    
                }
                
                
            })
            
            
        }else{
            
            self.momento.text = "Autenticación local ha fallado"
            self.alertVC.title = "Ooops!"
            
            switch touchError!._code {
            case LAError.Code.touchIDNotAvailable.rawValue:
                self.alertVC.message = "No existe TouchID en tu dispositivo"
            case LAError.Code.touchIDNotEnrolled.rawValue:
                self.alertVC.message = "No tienes huellas almacenadas"
            case LAError.Code.passcodeNotSet.rawValue:
                self.alertVC.message = "No hay contraseñas asignadas"
            default:
                self.alertVC.message = "Algo ha ido mal en la autenticación"
            }
            
            self.present(alertVC, animated: true, completion: { 
                self.comentario.text = self.alertVC.message
            })
            
            
        }
        
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertVC.addAction(alertAction)

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

}
