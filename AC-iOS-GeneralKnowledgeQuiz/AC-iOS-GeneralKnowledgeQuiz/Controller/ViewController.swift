//
//  ViewController.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by Tom Seymour on 11/7/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    var myQuestions = [Question]()
    var myfilteredQuestions: [Question]{
        let filterCatagory = myQuestions.filter{$0.category.lowercased() == Settings.categorySet.lowercased()}
        let filteredForDificulty = filterCatagory.filter{$0.difficulty.lowercased() == Settings.difficultySet.lowercased()}
        let filteredForCategory = filteredForDificulty.filter{$0.type.lowercased() == Settings.typSte.lowercased()}
        return filteredForCategory
    }
    // Mark - UItableView Methods Required I need the number of rows and how the cell will loook like
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myfilteredQuestions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let questionSetup = myfilteredQuestions[indexPath.row]
        guard let cell:UITableViewCell = myTableView.dequeueReusableCell(withIdentifier: "MyCell") else{
            let defaultCell = UITableViewCell()
            defaultCell.textLabel?.text = questionSetup.question
            return defaultCell
        }
        cell.textLabel?.text = questionSetup.question
        cell.detailTextLabel?.text = "category: \(questionSetup.category),Difficulty:\(questionSetup.difficulty), Type:\(questionSetup.type)"
        
        return cell
    }
    // End of tableView Methods

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailedQuestionViewController{
            let myIndex = self.myTableView.indexPathForSelectedRow?.row
            let questionSetup = myfilteredQuestions[myIndex!]
            destination.question = questionSetup
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // notice that view will appear is more relevant in this cas as we are changing the contents of the cells 
        self.myTableView.reloadData()
        print("view will appeared", Settings.difficultySet)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load", Settings.difficultySet)
        // Do any additional setup after loading the view, typically from a nib.
        self.myQuestions = Question.questions
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        
    }

}

