//
//  ActivitiesView.swift
//  Milestone3
//
//  Created by admin on 18.08.2022.
//

import SwiftUI

struct ActivitiesListView: View {
    @ObservedObject var activities: Activities
    var body: some View {
        NavigationView {
            ScrollView {
                List {
                    ForEach(activities.activities) { activity in
                        NavigationLink {
                            ActivityDetailView(activities: activities, id: activity.id)
                        } label: {
                            HStack {
                                Text(activity.emojiDescription)
                                    .font(.system(size: 30))
                                    .frame(width: 50, height: 50)
                                    .background(.gray)
                                    .cornerRadius(20)
                                Spacer()
                                VStack {
                                    Text(activity.displayName)
                                        .font(.headline)
                                    
                                    Text("Description")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ActivitiesListView_Previews: PreviewProvider {
    let activity = Activity(name: "Dancing", description: " ", emojiDescription: " ")
    static var previews: some View {
        ActivitiesListView(activities: Activities())
    }
}
