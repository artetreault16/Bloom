//
//  HomeViewController.swift
//  Bloom
//
//  Created by Apple on 6/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

//THIS MANAGES THE GARDEN
class HomeViewController: UIViewController {
    
    @IBOutlet weak var lblGoalName: UILabel!
    @IBOutlet weak var imgPlant: UIImageView!
    @IBOutlet weak var btnMake: UIButton!
    @IBOutlet weak var imgEncourage: UIImageView!
    @IBOutlet weak var imgWater: UIImageView!
    
    //images
    //var flowerA = UIImage()
    
    
    //non-item vars
    var goalName = String()
    var reminderMessage = String()
    var notes = String()
    var btnTitle = String()
    var counter = Int()
    var frequency = Int()
    var growFlower = ["flowerA.png", "flowerB.png", "flowerC.png", "flowerD.png"]
    var userGrow = ["flowerA.png", "flowerB.png", "flowerC.png", "flowerD.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPlant.image = UIImage(named: "blank.png")
        if btnTitle != "Change Goal"{
            btnTitle = "Make Goal"
            btnMake.setTitle(btnTitle, for: .normal)
        }else{
            btnTitle = "Change Goal"
            btnMake.setTitle(btnTitle, for: .normal)

        }
        //lets imageView be a button
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(mintImageTapped(tapGestureRecognizer:)))
        imgEncourage.isUserInteractionEnabled = true
        imgEncourage.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizerWater = UITapGestureRecognizer(target: self, action: #selector(waterImageTapped(tapGestureRecognizerWater:)))
        imgWater.isUserInteractionEnabled = true
        imgWater.addGestureRecognizer(tapGestureRecognizerWater)
        
        let tapGestureRecognizerPlant = UITapGestureRecognizer(target: self, action: #selector(plantImageTapped(tapGestureRecognizer:)))
        imgPlant.isUserInteractionEnabled = true
        imgPlant.addGestureRecognizer(tapGestureRecognizerPlant)
        
        //sharing data across files
        lblGoalName.text = goalName
        
        frequency = Int(reminderMessage) ?? 2
        if frequency < 2 {
            frequency = 2
        }else if frequency > 8 {
            frequency = 8
        }
        
        if frequency == 2{
            userGrow.remove(at: 0)
            userGrow.remove(at: 1)
        }else if frequency == 3{
            userGrow.remove(at: 0)
        }
        
        if imgPlant.image == UIImage(named: "flowerD"){
            lblGoalName.text = "Tap Your Plant!"
        }
        
    }
    
    @objc func plantImageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        if imgPlant.image == UIImage(named: userGrow[userGrow.count-1]){
            var alertController = UIAlertController(title: "Congratulations! 🎉", message: "You completed your goal!", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "YAY!", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func btnMakeGoal(_ sender: UIButton) {
        //hidden = true
        btnMake.setTitle("Change Goal", for: .normal)
    }
    
    
    
    @objc func mintImageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let messages = ["you can do it!", "don't give up!", "persevere!", "believe in yourself!", "hang in there!", "you are amazing!", "love yourself!"]
        let number = Int.random(in: 0..<messages.count)
        
        let encourageMint = messages[number]
        var alertController = UIAlertController(title: "EncourageMint!", message: encourageMint, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Thanks!", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    

    
    @objc func waterImageTapped(tapGestureRecognizerWater: UITapGestureRecognizer) {
        var alertController = UIAlertController(title: "Water Your Plant!", message: notes, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Did It!🥳", style: UIAlertAction.Style.default, handler: { action in
            
            if self.frequency < 5{
                self.imgPlant.image = UIImage(named: self.userGrow[self.counter])
            }else if self.frequency == 5{
                if self.counter == 0{
                    self.imgPlant.image = UIImage(named: self.userGrow[0])
                }else if self.counter == 2{
                    self.imgPlant.image = UIImage(named: self.userGrow[1])
                }else if self.counter == 3 || self.counter == 4{
                    self.imgPlant.image = UIImage(named: self.userGrow[self.counter-1])
                }
            }else if self.frequency == 6{
                if self.counter == 0{
                    self.imgPlant.image = UIImage(named: self.userGrow[0])
                }else if self.counter == 2 {
                    self.imgPlant.image = UIImage(named: self.userGrow[1])
                }else if self.counter == 4 || self.counter == 5{
                    self.imgPlant.image = UIImage(named: self.userGrow[self.counter-2])
                }
            }else if self.frequency == 7{
                if self.counter == 0 {
                    self.imgPlant.image = UIImage(named: self.userGrow[0])
                }else if self.counter == 2 {
                    self.imgPlant.image = UIImage(named: self.userGrow[1])
                }else if self.counter == 4 {
                    self.imgPlant.image = UIImage(named: self.userGrow[2])
                }else if self.counter == 6 {
                    self.imgPlant.image = UIImage(named: self.userGrow[3])
                }
            }else{
                if self.counter == 0 {
                    self.imgPlant.image = UIImage(named: self.userGrow[0])
                }else if self.counter == 2 {
                    self.imgPlant.image = UIImage(named: self.userGrow[1])
                }else if self.counter == 5 {
                    self.imgPlant.image = UIImage(named: self.userGrow[2])
                }else if self.counter == 7 {
                    self.imgPlant.image = UIImage(named: self.userGrow[3])
                }
            }
            
            if (self.counter + 1) < self.frequency {
                self.counter += 1
            }else{
                self.imgWater.isHidden = true
            }
        }))
        alertController.addAction(UIAlertAction(title: "Didn't☹️", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    
        if imgPlant.image == UIImage(named: "flowerC"){
            lblGoalName.text = "Tap Your Plant!"
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

