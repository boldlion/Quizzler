//
//  ViewController.swift
//  Quizzler
//
//  Created by Bold Lion on 12/11/2018.
//  Copyright (c) 2018 Quizzler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer = false
    var questionNumber = 0
    var score = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBarWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            // True
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            // False
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        progressBarWidthConstraint.constant = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
        progressBar.backgroundColor = .red
    }
    
    func nextQuestion() {
        if questionNumber <= allQuestions.list.count - 1 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }
        else {
            let alert = UIAlertController(title: "End Of Quiz", message: "Do you want to start over?", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Okay", style: .default, handler: { [unowned self] _ in
                self.startOver()
            })
            alert.addAction(okayAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func checkAnswer() {
        let answer = allQuestions.list[questionNumber].answer
        if pickedAnswer == answer {
            score += 1
            updateUI()
            ProgressHUD.showSuccess("Correct!")
        }
        else {
            ProgressHUD.showError("Wrong answer!")
        }
    }
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
    }
    
}
