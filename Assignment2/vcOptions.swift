//
//  vcOptions.swift
//  Assignment2
//
//  Created by Nick Boundris on 27/5/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit
import AVFoundation
class vcOptions: UIViewController {
    public var music = AVAudioPlayer()
    let url = Bundle.main.url(forResource: "bgMusic", withExtension: "mp3")
    
    @IBAction func volumeControl(_ sender: UISlider) {
        music.volume = sender.value
    }
    @IBAction func resetGame(_ sender: UIButton) {
        for i in 0..<shopValues.itemPurchased.count{
            shopValues.itemPurchased[i] = false
        }
        gameValues.autoBit = false
        gameValues.bitMulti = 1
        gameValues.bitPerClick = 1
        gameValues.bitPerTick = 1
        gameValues.bitScore = 0
        gameValues.bitTick = 1
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            music = try AVAudioPlayer(contentsOf: url!)
            music.prepareToPlay()
        }catch{
            print(error)
        }
        
        
        
        
        
        
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
