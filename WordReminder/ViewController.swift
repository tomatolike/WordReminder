//
//  ViewController.swift
//  WordReminder
//
//  Created by like on 2018/4/4.
//  Copyright © 2018年 like. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return 31
        }
        else {
            return 3
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return "Wordlist"+String(row+1)
        }
        else{
            return "Level"+String(row+1)
        }
    }
    
    let Reminder = ReminderModel()
    @IBOutlet weak var WordListChoice: UIPickerView!
    @IBOutlet weak var NowCount: UILabel!
    @IBOutlet weak var AllCount: UILabel!
    @IBOutlet weak var MissedCount: UILabel!
    @IBOutlet weak var ShowWord: UILabel!
    @IBOutlet weak var ShowMeaning: UITextView!
    @IBOutlet weak var ShowMeaningButton: UIButton!
    @IBOutlet weak var Next: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WordListChoice.dataSource=self
        WordListChoice.delegate=self
        WordListChoice.selectRow(0, inComponent: 0, animated: true)
        updateview()
    }
    
    @IBAction func StartGame(_ sender: UIButton) {
        let wordlist = WordListChoice.selectedRow(inComponent: 0)+1
        let wordlevel = WordListChoice.selectedRow(inComponent: 1)+1
        Reminder.startgame(wordlist: wordlist,wordlevel: wordlevel)
        ShowMeaningButton.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        self.view.bringSubview(toFront: ShowMeaningButton)
        self.view.sendSubview(toBack: ShowMeaning)
        updateview()
    }
    
    func updateview(){
        NowCount.text = String(Reminder.now+1)
        AllCount.text = String(Reminder.allcount)
        MissedCount.text = String(Reminder.missedcount)
        ShowWord.text = Reminder.theword.text
        ShowMeaning.text = Reminder.theword.meaning
    }
    
    @IBAction func LastWord(_ sender: UIButton) {
        if Reminder.allcount > 0{
            Reminder.lastword()
            ShowMeaningButton.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            self.view.bringSubview(toFront: ShowMeaningButton)
            self.view.sendSubview(toBack: ShowMeaning)
            updateview()
        }
    }
    
    @IBAction func NextWord(_ sender: UIButton) {
        if Reminder.allcount>0{
            Reminder.nextword()
            ShowMeaningButton.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            self.view.bringSubview(toFront: ShowMeaningButton)
            self.view.sendSubview(toBack: ShowMeaning)
            updateview()
        }
    }
    
    @IBAction func MissedWord(_ sender: UIButton) {
        if Reminder.allcount>0{
            Reminder.missedword()
            ShowMeaningButton.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            self.view.bringSubview(toFront: ShowMeaningButton)
            self.view.sendSubview(toBack: ShowMeaning)
            NextWord(Next)
        }
    }
    
    @IBAction func ShowTheMeaning(_ sender: UIButton) {
        sender.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.sendSubview(toBack: sender)
        self.view.bringSubview(toFront: ShowMeaning)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

