//
//  Game.swift
//  RockPaperScissorsApp
//
//  Created by Aleyna Aktaş on 8.07.2023.
//

import UIKit

class Game: UIViewController {
    
    private var optionsVisible = false

    var timer: Timer?
    var runCount = 3

    var computerChoose:String = ""
    var selectedOption: String = ""
    
    @IBOutlet weak var chooseButton: UIButton!
    
    @IBOutlet weak var counter: UILabel!
    
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissor: UIButton!

    
    @IBOutlet weak var userChooseImg: UIImageView!
    @IBOutlet weak var computerChooseImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        rock.isHidden = !optionsVisible
        paper.isHidden = !optionsVisible
        scissor.isHidden = !optionsVisible

    }
    
    enum Status: String {
        case rock = "Rock"
        case paper = "Paper"
        case scissor = "Scissor"
    }

    func randomSelection() -> String {
        let options = ["Rock", "Paper", "Scissor"]
        let randomIndex = Int.random(in: 0..<3)
        return options[randomIndex]
    }

    func showMessage (with message: String) {
        counter.text = message
        if (message == "Win") {
          userScore += 1;
        } else if message == "Lose" {
          computerScore += 1;
        }
    }

    func checkStatus (userChoice: String)   {

        computerChoose = randomSelection()
        if let choose = Status(rawValue: userChoice) {
            print("👉 Computer choose: \(computerChoose), Your choose: \(userChoice)")
            switch choose {
            case .rock:
                computerChoose == "Scissor" ? showMessage(with: "Win") : (computerChoose == "Rock" ? showMessage(with: "Draw") : showMessage(with: "Lose"))
            case .paper:
                computerChoose == "Rock" ? showMessage(with: "Win") : (computerChoose == "Paper" ? showMessage(with: "Draw") : showMessage(with: "Lose"))
            case .scissor:
                computerChoose == "Paper" ? showMessage(with: "Win") : (computerChoose == "Scissor" ? showMessage(with: "Draw") : showMessage(with: "Lose"))
            }
        }
    }

    @IBAction func toggle(_ sender: Any) {
        optionsVisible.toggle()
        rock.isHidden = !optionsVisible
        paper.isHidden = !optionsVisible
        scissor.isHidden = !optionsVisible
    }
    
    @IBAction func selectButton(_ sender: UIButton) {
        runCount = 3
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)

        counter.text = String(runCount)
        switch sender.tag {
           case 1:
            selectedOption = "Rock"
           case 2:
            selectedOption = "Paper"
           case 3:
            selectedOption = "Scissor"
           default:
               break
           }
        
    }
    
    @objc func fireTimer() {
        runCount -= 1
        counter.text = String(runCount)

        if runCount == 0 {
            checkStatus(userChoice: selectedOption)
            print(computerChoose)
            let userImg = UIImage(named: selectedOption + "User")
            let computerImg = UIImage(named: computerChoose + "Computer")
            userChooseImg.image = userImg
            computerChooseImg.image = computerImg
            timer?.invalidate()
        }
    }
}
