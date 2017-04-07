//
//  SNPostSocialNetworkViewController.swift
//  App_SocialNetWork
//
//  Created by cice on 31/3/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit
import Social

class SNPostSocialNetworkViewController: UIViewController {

    
    
    //MARK: - Outlet
    
    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var myImageView: UIImageView!
    
    
    
    
    
    //MARK: - Actions
    
    @IBAction func showCameraAction(_ sender: Any) {
        pickerPhoto()
    }
    
    @IBAction func showFacebookAction(_ sender: Any) {
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
            let postFacebook = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            postFacebook?.setInitialText(myTextView.text)
            postFacebook?.add(myImageView.image)
            postFacebook?.add(URL(string: "http://gumadev.com"))
            present(postFacebook!, animated: true, completion: nil)
            
            limpiarDatos()
            
        }else{
            present(muestraAlert("Cuenta de Facebook", "Por favor inicia la sesión de Facebook para compartir", "OK"), animated: true, completion: nil)
        }
        
    }
    
 
    
    @IBAction func showTwitterAction(_ sender: Any) {
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
            let postTwitter = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            postTwitter?.setInitialText(myTextView.text)
            postTwitter?.add(myImageView.image)
            postTwitter?.add(URL(string: "http://gumadev.com"))
            present(postTwitter!, animated: true, completion: nil)
            
            limpiarDatos()
            
        }else{
            present(muestraAlert("Cuenta de Twitter", "Por favor inicia la sesión de Twitter para compartir", "OK"), animated: true, completion: nil)
        }
        
    }
    
    @IBAction func showAlertVCAction(_ sender: Any) {
        
        
        
    }
    
    @IBAction func showActivityAction(_ sender: Any) {
        
    
        
        let textPost = myTextView.text
        let imagePost = myImageView.image
        let urlPost = "http://gumadev.com"
        
        let composePost = UIActivityViewController(activityItems: [textPost!, imagePost!, urlPost], applicationActivities: nil)
        
        present(composePost, animated: true, completion: nil)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Utils
    
    func limpiarDatos(){
        
        myTextView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        myImageView.image = #imageLiteral(resourceName: "placehoder")
        
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

extension SNPostSocialNetworkViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func pickerPhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            muestraMenu()
        }else{
            muestraLibreriaFotos()
        }
    }
    
    
    func muestraMenu(){
        let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let tomaFotoCamaraAction = UIAlertAction(title: "Toma Foto", style: .default) { _ in
            self.muestraCamaraDispositivo()
        }
        
        let selecionaFotoAction = UIAlertAction(title: "Selecciona desde la librería", style: .default) { _ in
            self.muestraLibreriaFotos()
        }
        
        alertVC.addAction(cancelAction)
        alertVC.addAction(tomaFotoCamaraAction)
        alertVC.addAction(selecionaFotoAction)
        present(alertVC, animated: true, completion: nil)
        
        
    }
    
    func muestraLibreriaFotos(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func muestraCamaraDispositivo(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imageData = info[UIImagePickerControllerOriginalImage] as? UIImage{
            myImageView.image = imageData
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
