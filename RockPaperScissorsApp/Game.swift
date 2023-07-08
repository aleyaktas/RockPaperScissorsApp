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
    var score = 0

    var selectedOption: String = ""
    
    @IBOutlet weak var chooseButton: UIButton!
    
    @IBOutlet weak var counter: UILabel!
    
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissor: UIButton!

    
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


    @IBAction func toggle(_ sender: Any) {
        optionsVisible.toggle()
        rock.isHidden = !optionsVisible
        paper.isHidden = !optionsVisible
        scissor.isHidden = !optionsVisible
    }
    
    @IBAction func selectButton(_ sender: UIButton) {
        runCount = 3
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeControl), userInfo: nil, repeats: true)
    }
    
    @objc func timeControl() {
        print("Timer fired!")
        runCount -= 1
        counter.text = String(runCount)
        print(runCount)

        if runCount == 0 {
            timer?.invalidate()
        }
    }
}
