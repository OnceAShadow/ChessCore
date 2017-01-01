//  BoardView.swift
//  ChessCore
//
//  Created by iOS MAC on 1/1/17.
//  Copyright © 2017 iOS MAC. All rights reserved.

import UIKit

class BoardView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(3.0)
        context?.setStrokeColor(UIColor.darkGray.cgColor)
        
        let boardSize = rect.size.width - 60
        let rectangle = CGRect(x: 30, y: (rect.size.height/2) - boardSize/2, width: boardSize , height: boardSize)
        let squareSize  = boardSize/8
        context?.addRect(rectangle)
        context?.strokePath()
        
        context?.move(to: CGPoint(x: 30, y: (rect.size.height/2) - boardSize/2))
        context?.addLine(to: CGPoint(x: 30 + boardSize, y: (rect.size.height/2) - boardSize/2))
        context?.addLine(to: CGPoint(x: 30 + boardSize, y: ((rect.size.height/2) - boardSize/2) + boardSize))
        context?.addLine(to: CGPoint(x: 30, y: ((rect.size.height/2) - boardSize/2) + boardSize))
        context?.addLine(to: CGPoint(x: 30, y: (rect.size.height/2) - boardSize/2))
        context?.setFillColor(UIColor.darkGray.cgColor)
        context?.fillPath()
        
        let squarePositionsOdd = [30 + squareSize, 30 + (squareSize * 3), 30 + (squareSize * 5), 30 + (squareSize * 7)]
        let squarePositionsEven = [30 , 30 + (squareSize * 2), 30 + (squareSize * 4), 30 + (squareSize * 6)]
        var squarePositionsUsed = squarePositionsOdd
        
        let insAndOuts = [1,0,1,0,1,0,1,0]
        let boardYStart = (rect.size.height/2) - (boardSize/2)
        
        for i in (0..<insAndOuts.count){
            
            if insAndOuts[i] == 0 {
                squarePositionsUsed = squarePositionsEven
            }else{
                squarePositionsUsed = squarePositionsOdd
            }
            
            for y in (0..<squarePositionsUsed.count){
                context?.move(to: CGPoint(x: squarePositionsUsed[y], y: boardYStart + (CGFloat(i) * squareSize)))
                context?.addLine(to: CGPoint(x: squarePositionsUsed[y] + squareSize, y: boardYStart + (CGFloat(i) * squareSize)))
                context?.addLine(to: CGPoint(x: squarePositionsUsed[y] + squareSize, y: boardYStart + (CGFloat(i) * squareSize) + squareSize))
                context?.addLine(to: CGPoint(x: squarePositionsUsed[y], y: boardYStart + (CGFloat(i) * squareSize) + squareSize))
                context?.addLine(to: CGPoint(x: squarePositionsUsed[y], y: boardYStart + (CGFloat(i) * squareSize)))
                context?.setFillColor(UIColor.lightGray.cgColor)
                context?.fillPath()

            }
        }
    }

}
