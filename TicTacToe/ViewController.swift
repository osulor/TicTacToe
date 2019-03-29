//
//  ViewController.swift
//  TicTacToe
//
//  Created by Mubarak Akinbola on 3/7/19.
//  Copyright © 2019 Mubarak Akinbola. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: Any) {
        gameOn = true
        player = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
        
        for i in 1..<10{
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
                
            }
        }
    }
    var gameOn = true
    var player = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningsCombinaison = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    @IBAction func buttonPressed(_ sender: AnyObject) {
        

            let position = sender.tag - 1
            
            if gameState[position] == 0 && gameOn {
                
                gameState[position] = player
                
                if (player == 1){
                    sender.setImage(UIImage(named: "nought.png"), for: [])
                    player = 2
                } else  {
                    
                    sender.setImage(UIImage(named: "cross.png"), for: [])
                    player = 1

                }
                
                for combinaison in winningsCombinaison{
                   
                    if gameState[combinaison[0]] != 0 && gameState[combinaison[0]] == gameState[combinaison[1]]  && gameState[combinaison[1]] == gameState[combinaison[2]]{
                         gameOn = false
                        
                        winnerLabel.isHidden = false
                        playAgainButton.isHidden = false
                        
                        if gameState[combinaison[0]] == 1{
                            winnerLabel.text = " Noughts have won!"
                            winnerLabel.font = UIFont.boldSystemFont(ofSize: 30)
                        } else {
                            winnerLabel.text = "Crosses have won!"
                            winnerLabel.font = UIFont.boldSystemFont(ofSize: 30)
                        }
                        
                        UIView.animate(withDuration: 1, animations: {
                            
                            self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                            self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                        })
                    
                    }
                }
                
            }
            
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

