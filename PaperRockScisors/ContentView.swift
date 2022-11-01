//
//  ContentView.swift
//  PaperRockScisors
//
//  Created by Arthur Sh on 31.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentChoice = ""
    @State private var didWin = false
    @State private var playerScore = 0
    @State private var isShownAlert = false
    @State private var random = Int.random(in: 0...2)
    
    
    
    @State private var choices = [ "Rock", "Paper", "Scisors"]
    
    var body: some View {
        VStack {
            Spacer()
            Text("Player score is: \(playerScore)")
                .font(.largeTitle.bold())
            
            Spacer()
            
            Text("Ai's choice: \(choices[random]) ")
                .padding(20)
            
            Spacer()
            
               Text("I choose: \(currentChoice)")
            
            HStack(spacing: 20){
                
                ForEach(0..<3) { number in
                    Button{
                        currentChoice = choices[number]
                        logic(ai: choices[random], player: currentChoice)
                        isShownAlert = true
                    } label: {
                        Text(choices[number])
                            .CustomButton()
                    }
                }
            }
            .padding(20)
            .alert("Next round", isPresented: $isShownAlert){
                Button("Continue", action: newRound)
            } message: {
                Text(didWin ? "You won score is \(playerScore)" : "You lost score is \(playerScore)")
               
            }
            Spacer()
            
        }
        .padding()
    }
    func logic (ai: String, player: String) {
        
        if ai == player {
            didWin = true
            playerScore += 1
        } else if ai == "Rock" && player == "Paper" {
            playerScore += 10
            didWin = true
        } else if   ai == "Rock" && player == "Scisors"  {
            playerScore -= 5
            didWin = false
        } else if ai == "Paper" && player == "Rock" {
            playerScore -= 5
            didWin = false
        } else if ai == "Paper" && player == "Scisors" {
            playerScore += 10
            didWin = true
        } else if ai == "Scisors" && player == "Rock" {
            playerScore += 10
            didWin = true
        } else if ai == "Scisors" && player == "Paper" {
            playerScore -= 5
            didWin = false
        }
        
    }
    
    func newRound() {
        random = Int.random(in: 0...2)
        currentChoice = ""
        
        
    }
    
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
