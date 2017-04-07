//
//  SNPlayMusicViewController.swift
//  App_SocialNetWork
//
//  Created by cice on 31/3/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit
import AVFoundation

class SNPlayMusicViewController: UIViewController {
    
    //MARK: - Variables locales
    var customPlayer = AVAudioPlayer()
    
    //MARK: - oulet
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myPlayAlpha: UIImageView!
    @IBOutlet weak var mySlider: UISlider!
    
    //MARK: - action
    
    @IBAction func myPlayACTION(_ sender: Any) {
        customPlayer.play()
        
        /*
        UIView.animate(withDuration: 0.5, animations: {
            self.myPlayAlpha.draw(CGRect(x: self.myPlayAlpha.frame.origin.x, y: self.myPlayAlpha.frame.origin.y, width: 300, height: 300))
            self.myPlayAlpha.alpha = 1.0
            
            
        })*/
        

    }
 
    @IBAction func myPauseACTION(_ sender: Any) {
        customPlayer.pause()
    }
    
    @IBAction func myStopACTION(_ sender: Any) {
        customPlayer.stop()
        customPlayer.currentTime = 0
    }
    
    @IBAction func mySliderACTION(_ sender: Any) {
        customPlayer.volume = mySlider.value
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImageView.layer.cornerRadius = myImageView.frame.width / 2
        myImageView.layer.borderWidth = 1.0
        myImageView.layer.borderColor = UIColor.white.cgColor
        
        dameAudio()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - utils
    
    func dameAudio(){
        
        let audioPath = Bundle.main.path(forResource: "song", ofType: "mp3")
        let url = URL(fileURLWithPath: audioPath!)
        
        do{
            customPlayer = try AVAudioPlayer(contentsOf: url)
        }catch let error{
            print("Error : \(error.localizedDescription)")
        }
        
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
