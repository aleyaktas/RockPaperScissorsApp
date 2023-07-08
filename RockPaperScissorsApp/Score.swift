//
//  Score.swift
//  RockPaperScissorsApp
//
//  Created by Aleyna Aktaş on 9.07.2023.
//

import UIKit
import Foundation


class Score: UIViewController {

    @IBOutlet weak var computerScoreText: UILabel!
    @IBOutlet weak var userScoreText: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var statusImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateValue()
    }
    
    func updateValue() {
        computerScoreText.text = "Computer Score: \(computerScore)"
        userScoreText.text = "Your Score: \(userScore)"
        if userScore > computerScore {
            status.text = "WINNER"
            let img = UIImage(named: "Win")
            statusImg.image = img
        } else if userScore < computerScore {
            status.text = "LOSE"
            let img = UIImage(named: "Lose")
            statusImg.image = img
       
        } else {
            status.text = "DRAW"
            let img = UIImage(named: "Draw")
            statusImg.image = img
       
        }
    }
    
   
    
    @IBAction func resetButtonAct(_ sender: Any) {
        userScore = 0
        computerScore = 0
        updateValue()
    }
}
