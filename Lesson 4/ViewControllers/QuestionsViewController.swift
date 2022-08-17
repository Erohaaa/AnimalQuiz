//
//  QuestionsViewController.swift
//  Lesson 4
//
//  Created by oleg on 14.05.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedSlider: UISlider!
    @IBOutlet var rangedLabels: [UILabel]!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    //MARK: - Private properties
    let questions = Question.getQuestions()
    var questionIndex = 0
    private var answersChoosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //MARK: - IBActions
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        guard let currentIndexButton = singleButtons.firstIndex(of: sender) else { return }
        
        let currentAnswer = currentAnswers[currentIndexButton]
        answersChoosen.append(currentAnswer)
        nextQuestion()
    }
    
    @IBAction func multipleButtonPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChoosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedButtonPressed() {
        let index = lroundf((rangedSlider.value) * Float(currentAnswers.count - 1))
        let currentIndex = currentAnswers[index]
        answersChoosen.append(currentIndex)
        nextQuestion()
    }
}
    
    




extension QuestionsViewController {
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        let currentQuestion = questions[questionIndex]
        questionLabel.text =  currentQuestion.text
        
        title = "Питання №\(questionIndex + 1) з \(questions.count)"
        
        let totalProgress = Float((questionIndex + 1)) / Float(questions.count)
        questionProgressView.setProgress(totalProgress, animated: true)
        
        showCurrentQuestion(type: currentQuestion)
        
    }
    
    private func showCurrentQuestion (type: Question) {
        switch type.type {
        case .single: showSingleStackView(for: currentAnswers)
        case .multiple: showMultipleStackView(for: currentAnswers)
        case .ranged: showRangedStackView(for: currentAnswers)
        }
    }
    
    func showSingleStackView(for answers: [Answer]) {
        singleStackView.isHidden = false
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    func showMultipleStackView(for answers: [Answer]) {
        multipleStackView.isHidden = false
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    func showRangedStackView(for answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    
}


//MARK: - Navigation

extension QuestionsViewController {
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < 3 {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultSegue" else { return }
        let resultVC = segue.destination as! ResultsViewController
        resultVC.surveyResults = answersChoosen
    }
}
