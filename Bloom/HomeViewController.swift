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

    var goal = PlantGoal()
    var GoalDelegate = GoalViewController()
    
    @IBOutlet weak var testLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //testLabel.text = GoalDelegate.goalDataBase[0].goalName
    }
    

    func getGoal() {
        
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

