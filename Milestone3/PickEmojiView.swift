//
//  SwiftUIView.swift
//  Milestone3
//
//  Created by admin on 18.08.2022.
//

import SwiftUI

struct PickEmojiView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activities: Activities
    @Binding var emojiDescription: String
    @FocusState private var didTapButton
    var type: String = "⚽️ 🏀 🎾 🏐 🏸 🏓 🛼 ⛸ 🛹 ⛷ 🏂 🏄 🚴‍♂️ 🏋️ 🤸 🎨 🎧 🧘 🎤 🎻 🎬 🏆 🏇 🎯 🚗 🚣‍♂️ ❤️ 🛐 🔞 🥘 🍕 🥂 🍽 ⛈ ❄️ ☔️ 🌚 🌝 🐀 🐥 🐵 🙈 🙉 🙊 👑 💍 💅 💆 🧖‍♂️ 🧑‍🏫 🫠 🥳 😇 🤩"
    
    var arrayOfEmojies: [String] {
        type.components(separatedBy: .whitespaces)
    }
    
    let collumns = [
        GridItem(.adaptive(minimum: 100))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: collumns) {
                ForEach(arrayOfEmojies, id: \.self) { emoji in
                    Button {
                        emojiDescription = emoji
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text(emoji)
                            .font(.system(size: 45))
                            .shadow(color: .black.opacity(0.3), radius: 20, x: 10, y: 10)
                            .padding(25)
                            .background(.ultraThinMaterial)
                            .cornerRadius(30)
                            .padding(10)
                    }
                }
            }
            .padding()
        }
        .background(Color(red: 0.45, green: 0.65, blue: 0.5))
        .ignoresSafeArea()
    }
}
