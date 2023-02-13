//
//  RPSView.swift
//  RSP
//
//  Created by Niels Taatgen on 15/6/20.
//  Copyright © 2020 Niels Taatgen. All rights reserved.
//

import SwiftUI

struct RPSView: View {
    @ObservedObject var viewModel: RPSViewModel
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image("rock")
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        self.viewModel.choose(card: "rock")
                }
                .border(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/, width: 4)
                Image("paper")
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        self.viewModel.choose(card: "paper")
                }
                .border(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)

                Image("scissors")
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        self.viewModel.choose(card: "scissors")
                }
                .border(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)

            }
            HStack {
                VStack {
                Text("Player")
                    .font(.title)
                    Text(viewModel.playerMood)
                        .font(.largeTitle)
                }
                Image(self.viewModel.playerChoice)
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                Text("Score \(viewModel.playerScore)")
                    .font(.title)
            }
            HStack {
                VStack {
                Text("Model")
                    .font(.title)
                    Text(viewModel.modelMood)
                        .font(.largeTitle)
                }
                Image(self.viewModel.modelChoice)
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .animation(.easeInOut)
                Text("Score \(viewModel.modelScore)")
                    .font(.title)
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RPSViewModel()
        return RPSView(viewModel: model)
    }
}
