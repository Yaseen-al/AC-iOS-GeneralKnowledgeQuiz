//
//  Settings.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by C4Q on 11/9/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import Foundation


struct Settings {
    static var difficulty: [String] = ["All", "Easy", "Medium", "Hard"]
    static var difficultySet: String = "easy"
    static var category: [String]{
        var ouputCategory = [""]
        for elements in Question.questions{
            if !ouputCategory.contains(elements.category){
                ouputCategory.append(elements.category)
            }
        }
        return ouputCategory
    }
    static var categorySet: String = "Sports"
    static var type: [String] = ["All", "multiple", "Boolean"]
    static var typSte: String = "multiple"
}
