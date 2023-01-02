//
//  ResultViewController.swift
//  QuizSwift
//
//  Created by Rafael Veronez Dias on 02/01/23.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var answerdLabel: UILabel!
    @IBOutlet weak var corretLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var totalCorrectAnswers: Int = 0
    var totalAnswers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerdLabel.text = "Perguntas respondidas: \(totalAnswers)"
        corretLabel.text = "Perguntas corretas: \(totalCorrectAnswers)"
        wrongLabel.text = "Perguntas erradas: \(totalAnswers - totalCorrectAnswers)"
        let score = String((totalCorrectAnswers * 100) / totalAnswers)
        scoreLabel.text = "\(score)%"

    }
    
    
    @IBAction func close(_ sender: UIButton) {
        performSegue(withIdentifier: "goToRoot", sender: sender)
    }
    
}
