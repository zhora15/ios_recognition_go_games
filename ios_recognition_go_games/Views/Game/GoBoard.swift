//
//  GoBoardView.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 06.03.2023.
//

import SwiftUI

struct Stone: Hashable {
    let x: Int
    let y: Int
    let colorLetter: String
}

struct GoBoard: View {
    private var stoneSize: CGFloat {
        switch boardSize {
        case 9:
            return 40
        case 13:
            return 30
        case 19:
            return 20
        default:
            return 20
        }
    }
    let boardSize: Int
    @Binding var stonesArray: [Stone]
    
    var body: some View {
        let originX: CGFloat = 20
        let originY: CGFloat = 20
        let cellWidthHeigth: CGFloat = (UIScreen.screenWidth-40)/CGFloat((boardSize-1))
        ZStack {
            Rectangle().fill(Color(r: 214, g: 192, b: 125)).frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth).border(.black, width: 1)
            Path { path in
                
                for row in 0..<boardSize {
                    
                    path.move(to: CGPoint(x: originX, y: originY + CGFloat(row) * cellWidthHeigth ))
                    
                    path.addLine(to: CGPoint(x: originX + CGFloat(boardSize - 1) * cellWidthHeigth, y: originY + CGFloat(row) * cellWidthHeigth))
                }
                for col in 0..<boardSize {
                    
                    path.move(to: CGPoint(x: originX + CGFloat(col) * cellWidthHeigth, y: originY))
                    
                    path.addLine(to: CGPoint(x: originX + CGFloat(col) * cellWidthHeigth, y: originY + CGFloat(boardSize - 1) * cellWidthHeigth))
                }
                
            }.stroke(Color.black)
            ForEach(stonesArray, id: \.self) { stone in
                switch stone.colorLetter {
                case "W":
                    Circle()
                        .fill(Color(r: 247, g: 247, b: 247))
                        .frame(width: stoneSize, height: stoneSize)
                        .position(x: originX+cellWidthHeigth*CGFloat(stone.x-1), y: originY+cellWidthHeigth*CGFloat(stone.y-1))
                    if stonesArray.lastIndex(of: stone) == stonesArray.count-1 {
                        Circle()
                            .strokeBorder(.black, lineWidth: 2).frame(width: stoneSize/2, height: stoneSize/2)
                            .position(x: originX+cellWidthHeigth*CGFloat(stone.x-1), y: originY+cellWidthHeigth*CGFloat(stone.y-1))
                    }
                case "B":
                    Circle()
                        .fill(Color(r: 21, g: 21, b: 21))
                        .frame(width: stoneSize, height: stoneSize)
                        .position(x: originX+cellWidthHeigth*CGFloat(stone.x-1), y: originY+cellWidthHeigth*CGFloat(stone.y-1))
                    if stonesArray.lastIndex(of: stone) == stonesArray.count-1 {
                        Circle()
                            .strokeBorder(.white, lineWidth: 2).frame(width: stoneSize/2, height: stoneSize/2)
                            .position(x: originX+cellWidthHeigth*CGFloat(stone.x-1), y: originY+cellWidthHeigth*CGFloat(stone.y-1))
                    }
                default:
                    Circle()
                        .fill(Color(r: 21, g: 21, b: 21))
                        .frame(width: stoneSize, height: stoneSize)
                        .position(x: originX+cellWidthHeigth*CGFloat(stone.x-1), y: originY+cellWidthHeigth*CGFloat(stone.y-1))
                    if stonesArray.lastIndex(of: stone) == stonesArray.count-1 {
                        Circle()
                            .strokeBorder(.white, lineWidth: 2).frame(width: stoneSize/2, height: stoneSize/2)
                            .position(x: originX+cellWidthHeigth*CGFloat(stone.x-1), y: originY+cellWidthHeigth*CGFloat(stone.y-1))
                    }
                }
                
            }
            
        }.scaledToFit()
    }
    
}


struct GoBoard_Previews: PreviewProvider {
    static var previews: some View {
        HStack{}
    }
}
