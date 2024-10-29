//
//  UserData.swift
//  Learning Journey App
//
//  Created by Ghadah Alhagbani on 25/04/1446 AH.
//

import Foundation

class UserData: ObservableObject {
    @Published var goal: String = ""
    @Published var selectedDuration: String = "" // Default duration
    @Published var streakCount: Int = 0
    @Published var learnedDays: Int = 0
    @Published var frozenDays: Int = 0
    @Published var timeSinceLastLearned: TimeInterval = 0 // in seconds
    @Published var freezeLimit: Int = 2 // Based on duration

    func resetStreak() {
        streakCount = 0
    }
    
    func updateFreezeLimit() {
        switch selectedDuration {
        case "Week":
            freezeLimit = 2
        case "Month":
            freezeLimit = 6
        case "Year":
            freezeLimit = 60
        default:
            freezeLimit = 2
        }
    }
    
    func logLearnedDay() {
        streakCount += 1
        learnedDays += 1
        timeSinceLastLearned = 0 // Reset time counter
    }

    func freezeDay() {
        frozenDays += 1
        if frozenDays > freezeLimit {
            frozenDays = freezeLimit // Prevents exceeding the limit
        }
    }
}

