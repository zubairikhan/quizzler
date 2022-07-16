//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var optionBtnC: UIButton!
    @IBOutlet weak var optionBtnB: UIButton!
    @IBOutlet weak var optionBtnA: UIButton!
    
    var quizBrain = QuizBrain()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let result = quizBrain.checkAnswer(userAnswer: userAnswer)
        if (result) {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.updateUI), userInfo: nil, repeats: false)
    
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        let options = quizBrain.getOptions()
        print(options[0])
        optionBtnA.setTitle(options[0], for: .normal)
        optionBtnB.setTitle(options[1], for: .normal)
        optionBtnC.setTitle(options[2], for: .normal)
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        optionBtnA.backgroundColor = UIColor.clear
        optionBtnB.backgroundColor = UIColor.clear
        optionBtnC.backgroundColor = UIColor.clear
        
    }
    
}

