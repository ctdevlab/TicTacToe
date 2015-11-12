//
//  ViewController.swift
//  TicTacToe
//
//  Created by Huy Tran on 11/10/15.
//  Copyright © 2015 Chris Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var TTT = TicTacToeGame()
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winnerLabel.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonPressed(sender: UIButton) {
        TTT.updateGameBoardAt(sender.tag, withColor: TTT.currentTurn)
        if TTT.currentTurn == "Red" {
            sender.backgroundColor = UIColor.redColor()
        } else {
            sender.backgroundColor = UIColor.blueColor()
        }
        TTT.checkGame()
        if TTT.gameOver == true {
            winnerLabel.hidden = false
            winnerLabel.text = "Congratulations! \(TTT.currentTurn) wins!"
        }
        TTT.updateTurn()
    }
    
    @IBAction func resetButtonPressed(sender: UIButton) {
        TTT.resetGame()
        viewDidLoad()
    }
}

