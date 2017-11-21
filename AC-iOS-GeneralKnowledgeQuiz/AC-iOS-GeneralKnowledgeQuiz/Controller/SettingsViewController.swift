//
//  SettingsViewController.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by C4Q on 11/9/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    
    @IBAction func DifficultySegmentController(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            Settings.difficultySet = Settings.difficulty[0]
        case 1:
            Settings.difficultySet = Settings.difficulty[1]
        case 2:
            Settings.difficultySet = Settings.difficulty[2]
        default:
            Settings.difficultySet = Settings.difficulty[3]
        }
    }
    
    
    @IBAction func typeSegmentController(_ sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex {
        case 0:
            Settings.typSte = Settings.type[0]
        case 1:
            Settings.typSte = Settings.type[1]
        default:
            Settings.typSte = Settings.type[2]
        }
    }
    

    @IBOutlet weak var categoryPicker: UIPickerView!
    // Mark --Picker: needs three methods number of rows, number of components, and row content as well as it needs a delegate and a data source
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Settings.category.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Settings.category[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Settings.categorySet = Settings.category[row]
        
        print(Settings.categorySet)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        // Do any additional setup after loading the view.
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
