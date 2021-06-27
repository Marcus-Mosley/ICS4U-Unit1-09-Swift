//
// ContentView.swift
// ICS4U-Unit1-09-Swift
//
// Created by Marcus A. Mosley on 2021-01-25
// Copyright (C) 2021 Marcus A. Mosley. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var random = Array(repeating: Array(repeating: 0, count: 6), count: 4)
    @State private var text: String = " "
    @State private var avg: Int = 0
    
    var body: some View {
        VStack {
            Text("The Random Numbers are:\(text)")
                .font(.body)
            Text("The class average is \(String(avg)).")
                .font(.body)
            Button("Start", action: {
                text = " "
                for counter in 0...3 {
                    for counter2 in 0...5 {
                        random[counter][counter2] = Int.random(in: 0...100)
                        text += String(random[counter][counter2]) + ", "
                    }
                }
                avg = avgArray(random)
            })
            .padding()
        }
    }
    
    // Calculates the average of the array
    func avgArray(_ random: [[Int]]) -> Int {
        var counter: Int = 0
        var counter2: Int = 0
        var sum = 0
        var size = 0
        
        for counter in 0...random.count - 1 {
            for counter2 in 0...random[counter].count - 1 {
                sum += random[counter][counter2]
            }
            size += random[counter].count
        }
        return sum / size
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
