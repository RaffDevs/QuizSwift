//
//  QuizViewController.swift
//  QuizSwift
//
//  Created by Rafael Veronez Dias on 02/01/23.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var AnswersButtons: [UIButton]!
    
    let quizManager = QuizManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        timerView.frame.size.width = view.frame.size.width
        
        UIView.animate(
            withDuration: 30.0,
            delay: 0,
            options: .curveLinear,
            animations: {
                self.timerView.frame.size.width = 0
            },
            completion: { success in
                self.showResults()
                
            }
        )
        
        getNewQuiz()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultViewcontroller = segue.destination as? ResultViewController {
            resultViewcontroller.totalAnswers = quizManager.totalAnswers
            resultViewcontroller.totalCorrectAnswers = quizManager.totalCorrectAnswers
        }
    }
    
    func getNewQuiz() {
        quizManager.getNextQuiz()
        questionLabel.text = quizManager.question
        
        for i in 0..<quizManager.options.count {
            let option = quizManager.options[i]
            let button = AnswersButtons[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    func showResults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    

    @IBAction func selectAnswer(_ sender: UIButton) {
        guard let index = AnswersButtons.firstIndex(of: sender) else { return }
        quizManager.validateAnswer(index: index)
        getNewQuiz()
    }
    
}
