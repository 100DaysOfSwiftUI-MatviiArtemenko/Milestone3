//
//  ContentView.swift
//  Milestone3
//
//  Created by admin on 18.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var colorChange = LinearGradient(colors: [.red,.orange], startPoint: .leading, endPoint: .trailing)
    @State private var animationAmount = false
    var body: some View {
        NavigationView {
            if activities.activities.isEmpty {
                ZStack {
                    Color(red: 0.5, green: 0.57, blue: 0.5)
                        .ignoresSafeArea()
                    VStack {
                        Spacer()
                        NavigationLink {
                            AddActivityView(activities: activities)
                        } label: {
                            VStack {
                                Image(systemName: "plus")
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(0.7)
                                
                                Text("Add new activity.")
                                    .font(.headline)
                                    .padding(.bottom)
                            }
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: 150)
                        .foregroundColor(.white.opacity(0.6))
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(20)
                    }
                    .padding(10)
                }
            } else {
                List {
                    ForEach(activities.activities) { activity in
                        NavigationLink {
                            ActivityDetailView(activities: activities, colorChange: $colorChange, id: activity.id)
                        } label: {
                            HStack {
                                Text(activity.emojiDescription)
                                    .font(.system(size: 50))
                                    .shadow(color: .black.opacity(0.3), radius: 20, x: 10, y: 10)
                                    .padding(10)
                                    .background {
                                        Circle()
                                            .fill(.ultraThinMaterial)
                                            .frame(minWidth: 100)
                                            .overlay {
                                                Circle()
                                                    .fill(activities.setColor(activity: activity))
                                                    .frame( maxWidth: 25)
                                                    .shadow(color: .black.opacity(0.3), radius: 20, x: 10, y: 10)
                                                    .offset(x: -32.5, y: -32.5)
                                            }
                                    }
                                VStack(alignment: .trailing) {
                                    Text(activity.displayName)
                                        .font(.headline)
                                }
                                
                            }
                        }
                        .foregroundColor(.white)
                        .padding(10)
                        .listRowBackground(Color(red: 0.3, green: 0.35, blue: 0.45))
                    }
                    .onDelete(perform: deleteFromList)
                }
                .navigationBarItems(leading: EditButton(),
                                    trailing: NavigationLink("Add"){
                    AddActivityView(activities: activities)
                })
                
            }
        }
    }
    
    func deleteFromList(at offsets: IndexSet) {
        activities.activities.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
