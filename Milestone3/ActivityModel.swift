//
//  ActivityModel.swift
//  Milestone3
//
//  Created by admin on 18.08.2022.
//

import Foundation
import SwiftUI

class Activities: ObservableObject {
    
    let key = "activities"
    @Published var activities = [Activity]() {
        
        didSet {            //saves data on any update
            
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }
    }
    init() {
        if let encoded = UserDefaults.standard.data(forKey: key) {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: encoded) {
                activities = decoded
                return
            }
        }
        activities = []
    }
    
    func add(newAct: Activity) {
        activities.append(newAct)
    }
    
    func setColor(activity: Activity ) -> AngularGradient {
        var thisActivity = getActivity(id: activity.id)
        var setGradient: AngularGradient
        
        if thisActivity.donenessParameter {
            setGradient = AngularGradient(gradient: Gradient(colors: [.green,.yellow,.teal]), center: .topLeading, startAngle: .zero, endAngle: .degrees(270))
            return setGradient
        } else {
            setGradient = AngularGradient(gradient: Gradient(colors: [.red,.yellow,.pink]), center: .topLeading, startAngle: .zero, endAngle: .degrees(270))
            return setGradient
        }
    }
    
    func getActivity(id: UUID) -> Activity {
        let getIndex = activities.firstIndex(where: { $0.id == id })
        guard let index = getIndex else {return Activity(name: " ", description: " ", emojiDescription: " ") }
        
        return activities[index]
    }
    
    func update(activity: Activity) {
        let getIndex = activities.firstIndex(where: { $0.id == activity.id })
        guard let index = getIndex else { return }
        
        activities[index] = activity
    }
}

struct Activity: Codable, Identifiable {
    var id = UUID()
    var name: String?
    var description: String
    var emojiDescription: String
    var donenessParameter: Bool = false
    
    //var date = Date.now()
    var displayName: String {
        return name ?? "non"
    }
}
