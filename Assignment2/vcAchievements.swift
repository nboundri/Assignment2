//
//  vcAchievements.swift
//  Assignment2
//
//  Created by Nick Boundris on 19/5/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit

class vcAchievements: UIViewController {
    
    @IBOutlet var achieveCollection: [UIView]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if(gameValues.totalClicks >= 1){
            achieveCollection[0].backgroundColor = UIColor.green
        }
        if(shopValues.itemPurchased[0] == true){
            achieveCollection[1].backgroundColor = UIColor.green
        }
        if(shopValues.itemPurchased[3] == true){
            achieveCollection[2].backgroundColor = UIColor.green
        }
        if(shopValues.itemPurchased[6] == true){
            achieveCollection[3].backgroundColor = UIColor.green
        }
        if(gameValues.totalClicks >= 500){
            achieveCollection[4].backgroundColor = UIColor.green
        }
        if(shopValues.itemPurchased[1] == true){
            achieveCollection[5].backgroundColor = UIColor.green
        }
        if(shopValues.itemPurchased[4] == true){
            achieveCollection[6].backgroundColor = UIColor.green
        }
        if(shopValues.itemPurchased[7] == true){
            achieveCollection[7].backgroundColor = UIColor.green
        }
        if(gameValues.totalClicks >= 1000){
            achieveCollection[8].backgroundColor = UIColor.green
        }
        if(shopValues.itemPurchased[2] == true){
            achieveCollection[9].backgroundColor = UIColor.green
        }
        if(shopValues.itemPurchased[5] == true){
            achieveCollection[10].backgroundColor = UIColor.green
        }
        if(shopValues.itemPurchased[8] == true){
            achieveCollection[11].backgroundColor = UIColor.green
        }
        if(gameValues.totalClicks >= 2000){
            achieveCollection[12].backgroundColor = UIColor.green
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
