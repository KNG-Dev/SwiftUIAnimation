//
//  AppleWalletView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 7/19/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI

// constants
let cardWidth: CGFloat = 343
let cardHeight: CGFloat = 212
let spacing = 36
let animation = Animation.spring()
let cardColors = [
    Color(UIColor.systemRed),
    Color(UIColor.systemOrange),
    Color(UIColor.systemYellow),
    Color(UIColor.systemGreen),
    Color(UIColor.systemBlue),
    Color(UIColor.systemIndigo),
    Color(UIColor.systemPurple)
]

class AppleWalletView: ObservableObject {
    @Published var cards: [Card] = []
    
    init() {
        // loop through the card colors to set up our wallet
        for i in 0..<cardColors.count {
            let card = Card(backgroundColor: cardColors[i], yOffset: CGFloat(i * spacing))
            self.cards.append(card)
        }
    }
    
    func resetCards() {
        // reset the wallet back to its normal state
        for (i, card) in self.cards.enumerated() {
            withAnimation(animation) {
                card.yOffset = CGFloat(i * spacing)
            }
        }
    }
    
    func tapCard(card: Card) {
        // when you tap on a card in the wallet
        let tappedCardIndex = cards.firstIndex { $0.id == card.id }!
        var cardPadding = spacing
        
        // restore cards to their original positions
        self.resetCards()
        
        if card.tapped {
            card.tapped = false
            
            withAnimation(animation) {
                card.flipped = false
            }
        } else {
            card.tapped = true
            withAnimation(animation) {
                // move tapped card to the top
                card.yOffset = 0
            }
            
            for (i, walletCard) in self.cards.enumerated() {
                if walletCard.id == card.id {
                    // skip the card we tapped
                    continue
                } else {
                    walletCard.tapped = false
                    withAnimation(animation) {
                        walletCard.flipped = false
                    }
                    if i > tappedCardIndex {
                        // remove additional spacing between cards beneath the tapped card
                        cardPadding = 0
                    }
                    
                    withAnimation(animation) {
                        walletCard.yOffset = cardHeight + CGFloat(cardPadding) + walletCard.yOffset
                    }
                }
            }
        }
        
    }
}

class Card: ObservableObject, Identifiable {
    var id = UUID()
    var last4: String = "9999"
    var tapped = false
    @Published var flipped = false
    @Published var backgroundColor: Color
    @Published var yOffset: CGFloat
    
    init(backgroundColor: Color, yOffset: CGFloat) {
        self.backgroundColor = backgroundColor
        self.yOffset = yOffset
        self.last4 = randomNumber(digits: 4)
    }
    
    func randomNumber(digits: Int) -> String {
        // generate random last 4 digits
        var number = String()
        for _ in 1...digits {
            number += "\(Int.random(in: 1...9))"
        }
        return number
    }
}



struct TappableView: ViewModifier {
    @ObservedObject var wallet: AppleWalletView
    @ObservedObject var card: Card
    
    func body(content: Content) -> some View {
        content
            .onTapGesture(perform: {
                self.wallet.tapCard(card: self.card)
            })
            //Moves card down when card is selected
            .offset(y: card.yOffset)
//            .rotation3DEffect(.degrees(card.tapped ? 0 : isAnyCardTapped() ? -8 : 0), axis: (x: 1, y: 0, z: 0))
            //Flips cards when hits settings
            .rotation3DEffect(.degrees(card.flipped ? -180 : 0), axis: (x: 0, y: 1, z: 0))
    }
    
    func isAnyCardTapped() -> Bool {
        for card in self.wallet.cards {
            if card.tapped {
                return true
            }
        }
        
        return false
    }
}

extension View {
    func tappable(wallet: AppleWalletView, card: Card) -> some View {
        return modifier(TappableView(wallet: wallet, card: card))
    }
}
struct AppleWalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView(wallet: AppleWalletView())
    }
}
