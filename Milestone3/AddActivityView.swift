//
//  AddActivityView.swift
//  Milestone3
//
//  Created by admin on 18.08.2022.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activities: Activities
    
    @State private var name = ""
    @State private var description: String = ""
    @State private var emojiDescription = " "
    @State private var showingEmojiView = false
    @State private var colorChange = LinearGradient(colors: [.red,.orange], startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        ZStack {
            Color(red: 0.4, green: 0.5, blue: 0.35)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text(emojiDescription)
                    .font(.system(size: 100))
                    .padding(10)
                    .shadow(color: .black.opacity(0.6), radius: 20, x: 10, y: 10)
                HStack {
                    Text("Name the activity")
                        .padding(10)
                    TextField("Name", text: $name)
                        .labelStyle(.titleOnly)
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .padding(10)
                HStack {
                    
                    Text("Describe activity")
                        .padding(10)
                    TextField("Describe activity",text: $description)
                        .labelStyle(.titleOnly)
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .padding(10)
                Spacer()
            }
            .foregroundColor(.white)
            .navigationTitle(emojiDescription)
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showingEmojiView) {
                PickEmojiView(activities: activities, emojiDescription: $emojiDescription)
                
            }
            .toolbar {
                HStack {
                    Button {
                        let activity = Activity(name: name, description: description, emojiDescription: emojiDescription)
                        activities.add(newAct: activity)
                        presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        Image(systemName: "plus.app")
                        
                    }
                    
                    Button {
                        showingEmojiView = true
                    } label: {
                        Image(systemName: "face.smiling")
                    }
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activities: Activities())
    }
}
