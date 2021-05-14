//
//  ContentView.swift
//  deneme
//
//  Created by calatinalper on 14.05.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
   @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...3)
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient:Gradient(colors: [.black,.red,.orange,.yellow]),startPoint:.top,endPoint:.bottom).edgesIgnoringSafeArea(.all)
        VStack(spacing : 20){
            
            
            VStack{
                Text("Which one is").fontWeight(.heavy).foregroundColor(.white).bold().font(.system(size: 23))
                Text(countries[correctAnswer]).font(.system(size: 63)).fontWeight(.semibold).foregroundColor(.white)
                
            }
            ForEach(0 ..< 4) { number in
                Button(action: {
                   // flag was tapped
                    self.flagTapped(number)
                }) {
                    Image(self.countries[number])
                        .renderingMode(.original).clipShape(Capsule()).overlay(Capsule().stroke(Color.black,lineWidth: 1)).shadow(color:.black, radius: 22 )
                }
            }
            Spacer()
            Text("Your Score:\(score)").font(.title).fontWeight(.semibold).foregroundColor(.white)
        }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("your score is"), dismissButton: .default(Text("continue")){
                self.askQuestion()
        })
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong, "
        }

        showingScore = true
    }
     func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...3)
    }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
