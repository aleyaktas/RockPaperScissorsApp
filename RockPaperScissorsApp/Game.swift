//
//  Game.swift
//  RockPaperScissorsApp
//
//  Created by Aleyna Aktaş on 8.07.2023.
//

import UIKit

class Game: UIViewController {
    
    private var optionsVisible = false

    @IBOutlet weak var buttonStack: UIStackView!
    
    @IBOutlet weak var chooseButton: UIButton!
    
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissor: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        rock.isHidden = !optionsVisible
        paper.isHidden = !optionsVisible

        scissor.isHidden = !optionsVisible
        buttonStack.layer.cornerRadius = 16

    }
    

    @IBAction func toggle(_ sender: Any) {
        optionsVisible.toggle()
        rock.isHidden = !optionsVisible
        paper.isHidden = !optionsVisible

        scissor.isHidden = !optionsVisible

    }
    
}
