//
//  vcGame.swift
//  Assignment2
//
//  Created by Nick Boundris on 19/5/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit
import CoreMotion
class gameValues{
    public static var bitScore : Int = 0
    public static var bitPerClick : Int = 1
    public static var bitMulti : Int = 1
    public static var autoBit : Bool = false
    public static var bitPerTick : Int = 0
    public static var bitTick : Double = 0
    public static var totalClicks : Int = 0
}


class vcGame: UIViewController {

    @IBOutlet weak var mainButtonOutlet: UIButton!
    @IBOutlet weak var BitScore: UILabel!
    @IBOutlet weak var scoreProgressBar: UIProgressView!
    var maxCapcity = 2500
    var timer : Timer?
    var motionManager = CMMotionManager()
    
    func checkItems(){
        //CPUs
        if(shopValues.itemPurchased[0] == true){
            gameValues.bitPerTick = 1
            gameValues.autoBit = true
        }
        if(shopValues.itemPurchased[1] == true){
            gameValues.bitPerTick = 5
            gameValues.autoBit = true
        }
        if(shopValues.itemPurchased[2] == true){
            gameValues.bitPerTick = 10
            gameValues.autoBit = true
        }
        //RAMs
        if(shopValues.itemPurchased[3] == true){
            gameValues.bitPerClick = 2
            
        }
        if(shopValues.itemPurchased[4] == true){
            gameValues.bitPerClick = 5
            
        }
        if(shopValues.itemPurchased[5] == true){
            gameValues.bitPerClick = 15
            
        }
        if(shopValues.itemPurchased[6] == true){
            maxCapcity = 6500
            
        }
        if(shopValues.itemPurchased[6] == true){
            maxCapcity = 10000
            
        }
        if(shopValues.itemPurchased[6] == true){
            maxCapcity = 20000
            
        }
        if(gameValues.autoBit == true){
            stopTimer()
            startTimer()
            
        }
        if(gameValues.bitScore == maxCapcity){
            gameValues.bitScore = maxCapcity
        }
        
    }
    func startTimer(){
        if(timer == nil){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerIncrement), userInfo: nil, repeats: true)
        }
    }
    func stopTimer(){
        if(timer != nil){
            timer?.invalidate()
            timer = nil
        }
    }
    @objc func timerIncrement(){
        gameValues.bitScore = gameValues.bitScore + gameValues.bitPerTick
        formatBar()
        BitScore.text = String(gameValues.bitScore)
        rotate()
    }
    
    @IBAction func MainButtonOnClick(_ sender: UIButton) {
        if(gameValues.bitScore == maxCapcity){
            gameValues.bitScore = maxCapcity
        }
        else{
            BitScore.text = String(calcScore())
            gameValues.totalClicks += 1
            formatBar()
            rotate()
        }
    }
    
    func calcScore() -> Int{
        gameValues.bitScore = (gameValues.bitScore + gameValues.bitPerClick) * gameValues.bitMulti
        return gameValues.bitScore
    }
    
    func rotate(){
        UIView.animate(withDuration: 0.5, animations: {
            self.mainButtonOutlet.transform = self.mainButtonOutlet.transform.rotated(by: 360)
        })
    }
    
    func formatBar(){
        var progress : Float
        progress = Float(gameValues.bitScore)/Float(maxCapcity)
        
        scoreProgressBar.progress = progress
    }
    func accelUpdate(){
        motionManager.accelerometerUpdateInterval = 0.3
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data{
                if(myData.acceleration.x >= 3 || myData.acceleration.y >= 3 || myData.acceleration.z >= 3){
                    gameValues.bitScore += 1
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BitScore.text = String(gameValues.bitScore)
        rotate()
        checkItems()
        accelUpdate()
        
        //BitProgressBar.transform = BitProgressBar.transform.scaledBy(x: 40, y: 20)
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
