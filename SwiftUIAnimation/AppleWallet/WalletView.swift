//
//  WalletView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 7/19/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI

struct WalletView: View {
    @ObservedObject var wallet: AppleWalletView
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                ForEach(self.wallet.cards, id: \.id) { card in
                    CardView(card: card)
                        .tappable(wallet: self.wallet, card: card)
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct CardView: View {
    @ObservedObject var card: Card
    
    var flippedToggle: some View {
        HStack {
            Spacer()
            
            if self.card.tapped {
                Button(action: {
                    withAnimation(.spring()) {
                        self.card.flipped.toggle()
                    }
                }) {
                    Image(systemName: self.card.flipped ? "xmark.circle.fill" : "ellipsis.circle.fill")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    var cardFront: some View {
        VStack {
            HStack {
                Spacer()
                self.flippedToggle
            }
            
            Spacer()
            
            HStack {
                Text("•••• \(card.last4)")
                    .font(.system(size: 16, design: .monospaced))
                    .foregroundColor(.white)
                Spacer()
            }
        }
    }
    
    var cardBack: some View {
        VStack {
            HStack {
                Spacer()
                self.flippedToggle
            }
            
            Divider()
                .padding(.vertical)
            
            Spacer()
            
            HStack {
                Text("1234")
                Spacer()
                Text("5678")
                Spacer()
                Text("9012")
                Spacer()
                Text(card.last4)
            }
            .padding(.horizontal)
            .font(.system(size: 18, weight: .semibold, design: .monospaced))
            .foregroundColor(.white)
            
            Spacer()
            
            HStack {
                Text("Kenny Ho")
                Spacer()
                Text("KNG-Development")
            }
            .font(.caption)
            .foregroundColor(.white)
        }
        .rotation3DEffect(.degrees(-180), axis: (x: 0, y: 1, z: 0))
    }
    
    var body: some View {
        VStack {
            if card.flipped {
                cardBack
            } else {
                cardFront
            }
        }
        .padding()
        .frame(width: cardWidth, height: cardHeight)
        .background(card.backgroundColor)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(UIColor.black.withAlphaComponent(0.12)), lineWidth: 1)
                .shadow(color: Color(UIColor.white.withAlphaComponent(0.12)), radius: 0.5, x: 0, y: 1)
            
        )
            .shadow(color: Color(UIColor.black.withAlphaComponent(0.12)), radius: 16, x: 0, y: 8)
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView(wallet: AppleWalletView())
    }
}
