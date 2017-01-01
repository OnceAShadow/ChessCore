//  BoardViewController.swift
//  ChessCore
//
//  Created by iOS MAC on 1/1/17.
//  Copyright © 2017 iOS MAC. All rights reserved.

import UIKit

class BoardViewController: UIViewController {

    // 2 Arrays for the players in game pieces
    // 2 Arrays for the players out of game pieces
    
    // Turn count? Do I Make this MVVM + Tests?
    // Game moves record.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let boardView = BoardView.init(frame: CGRect(x: 0,y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.view.addSubview(boardView)
        
    }

}
