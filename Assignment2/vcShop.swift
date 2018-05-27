//
//  vcShop.swift
//  Assignment2
//
//  Created by Nick Boundris on 20/5/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit
class shopValues{
    public static var itemPurchased : [Bool] = [false, false ,false ,false ,false, false, false, false, false, false]
    public static var itemCost : [Int] = [20, 50, 125, 30, 60, 150, 60, 125, 500, 100]
    
}

class vcShop: UIViewController {
    @IBOutlet weak var BitScoreShop: UILabel!
    @IBOutlet var purchaseButton: [UIButton]!
    @IBOutlet var itemPrice: [UILabel]!
    var timer2 : Timer?
    
    
    @IBAction func onPurchase(_ sender: UIButton) {
        if(gameValues.bitScore >= shopValues.itemCost[sender.tag] && shopValues.itemPurchased[sender.tag] == false){
            shopValues.itemPurchased[sender.tag] = true
            gameValues.bitScore -= shopValues.itemCost[sender.tag]
            sender.setImage(UIImage(named: "purchased"), for: .normal)
            BitScoreShop.text = String(gameValues.bitScore)
        }
    }
    
    @objc func startLoop(){
        purchaseCheck()
        applyPurchases()
        BitScoreShop.text = String(gameValues.bitScore)
    }
    
    func applyPurchases(){
        for i in 0..<purchaseButton.count{
            if(shopValues.itemPurchased[i] == true){
                purchaseButton[i].setImage(UIImage(named: "purchased"), for: .normal)
            }
        }
    }
    
    func purchaseCheck(){
        for i in 0..<purchaseButton.count{
            if(gameValues.bitScore >= shopValues.itemCost[i] && shopValues.itemPurchased[i] == false){
                purchaseButton[i].setImage(UIImage(named: "purchase-can"), for: .normal)
            }
            else if(gameValues.bitScore < shopValues.itemCost[i] && shopValues.itemPurchased[i] == false){
                purchaseButton[i].setImage(UIImage(named: "purchase-lock"), for: .normal)
            }
        }
    }
    
    func startTimer(){
        if(timer2 == nil){
            timer2 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.startLoop), userInfo: nil, repeats: true)
        }
    }
    func stopTimer(){
        if(timer2 != nil){
            timer2?.invalidate()
            timer2 = nil
        }
    }
    func setPrices(){
        for i in 0..<itemPrice.count{
            itemPrice[i].text = String(shopValues.itemCost[i]) + " Points"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopTimer()
        startTimer()
        setPrices()
        
        
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
