//
//  DetailedQuestionViewController.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by C4Q on 11/9/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class DetailedQuestionViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    
    var question:Question? = nil
    
    var possibleAnswers: [String] = [""]
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var myPicker: UIPickerView!
    
    //Mark -- Picker: Methods Required number of components, nomber of rows in each componenets as well as the layout of the rows, picker needs a delegate as well as  a data source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return possibleAnswers.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        return possibleAnswers[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if possibleAnswers[row] == question?.correctAnswer{
            view.backgroundColor? = UIColor.green
        }
        else{
            view.backgroundColor = UIColor.red
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myPicker.delegate = self
        self.myPicker.dataSource = self
        if let question = question{
            self.questionLabel.text = question.question
            
            var mypossibleAnswers:[String]{
                let random = Int(arc4random_uniform(UInt32((question.incorrectAnswers.count) + 1)))
                var answers = question.incorrectAnswers
                answers.insert((question.correctAnswer), at: random)
                return answers
            }
            self.possibleAnswers = mypossibleAnswers
            
        }
        
        
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
