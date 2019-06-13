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
    
    var homeDelegate = HomeViewController()
    
    @IBOutlet weak var txtGoalName: UITextField!
    @IBOutlet weak var txtReminderMessage: UITextField! //frequency
    @IBOutlet weak var txtNotes: UITextField! //message
    
    var goalName = String()
    var reminderMessage = String()
    var notes = String()
    var btnTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var DestViewController : HomeViewController = segue.destination as! HomeViewController

        "hello";DestViewController.goalName = txtGoalName.text ?? "hello"
        "hello";DestViewController.reminderMessage = txtReminderMessage.text ?? "hello"
        "hello";DestViewController.notes = txtNotes.text ?? "hello"
        "hello";DestViewController.btnTitle = "Change Goal"
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
