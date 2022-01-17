//
//  GameView.swift
//  Tic
//
//  Created by kevin on 11/01/2022.
//

import SwiftUI

struct GameView: View {
    
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: viewModel.columns, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack{
                            GameCircleView(proxy: geometry)
                            PlayerView(systemImageName:  viewModel.moves[i]?.indicator ?? "")
                        }
                        .onTapGesture {
                            viewModel.processPlayerMoves(for: i)
                        }
                    }
                }
                Spacer()
            }
            .disabled(viewModel.isGameBoardDisabled)
            .padding()
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonMessage, action: { viewModel.resetgame()}))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct GameCircleView: View {
    var proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundColor(.blue).opacity(0.5)
            .frame(width: proxy.size.width/3 - 15, height: proxy.size.width/3 - 15)
    }
}

struct PlayerView: View {
    
    var systemImageName: String
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
    }
}
