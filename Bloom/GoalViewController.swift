//
//  GoalViewController.swift
//  Bloom
//
//  Created by Apple on 6/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

//THIS MANAGES GOAL SETTING
class GoalViewController: UIViewController {
    var goal = PlantGoal()
    var goalDataBase = [PlantGoal]()
    
    var homeDelegate = HomeViewController()
    
    @IBOutlet weak var txtGoalName: UITextField!
    @IBOutlet weak var txtReminderMessage: UITextField!
    @IBOutlet weak var txtNotes: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSave(_ sender: UIButton) {
        goal.goalName = txtGoalName.text!
        goal.reminderMessage = txtReminderMessage.text!
        goal.notes = txtNotes.text!
        goalDataBase.append(goal)
        testLabel.text = goal.goalName
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
