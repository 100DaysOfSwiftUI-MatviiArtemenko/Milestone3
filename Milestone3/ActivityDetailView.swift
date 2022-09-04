//
//  ActivityDetailView.swift
//  Milestone3
//
//  Created by admin on 18.08.2022.
//

import SwiftUI

struct ActivityDetailView: View {
    @ObservedObject var activities: Activities
    @Binding var colorChange: LinearGradient
    var id : UUID
    var thisActivity: Activity {
        return activities.getActivity(id: id)
    }
    var body: some View {
        ZStack {
            Color(red: 0.4, green: 0.55, blue: 0.45)
                .ignoresSafeArea()
            VStack {
                Text(thisActivity.emojiDescription)
                    .font(.system(size: 100))
                    .padding(10)
                    .shadow(color: .black.opacity(0.6), radius: 20, x: 10, y: 10)
                    .padding(.bottom)
                
                Text(thisActivity.displayName)
                    .font(.largeTitle)
                    .padding(10)
                    .foregroundColor(.white)
                Text(thisActivity.description)
                    .font(.headline)
                    .padding(10)
                    .foregroundColor(.white)
                
                Spacer()
                Button {
                    updateActivity(this: thisActivity)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(activities.setColor(activity: thisActivity))
                            .frame( maxWidth: 200, maxHeight: 110)
                            .frame(minWidth: 150, minHeight: 80)
                        
                        VStack {
                            Text(thisActivity.donenessParameter ? "Done." : "Do.")
                        }
                    }
                }
                .foregroundColor(.white)
                .font(.headline)
                .shadow(color: .black.opacity(0.4), radius: 10, x: 8, y: 8)
                .padding(.bottom)
                .padding()
            }
            .frame( maxWidth: .infinity, maxHeight: .infinity)
            .padding(10)
            .background(.ultraThinMaterial)
            .cornerRadius(30)
            .padding([.horizontal,.bottom])
        }
    }
    func updateActivity(this activity: Activity) {
        var changedActivity = activities.getActivity(id: activity.id)
        changedActivity.donenessParameter.toggle()
        activities.update(activity: changedActivity)
    }
}


