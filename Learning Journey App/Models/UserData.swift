//
//  UserData.swift
//  Learning Journey App
//
//  Created by Ghadah Alhagbani on 25/04/1446 AH.
//

import Foundation

class UserData: ObservableObject {
    @Published var goal: String = ""
    @Published var selectedDuration: String = "" // duration
    @Published var streakCount: Int = 0
    @Published var learnedDays: Int = 0
    @Published var frozenDays: Int = 0
    @Published var timeSinceLastLearned: TimeInterval = 0 // in seconds
    @Published var freezeLimit: Int = 2 // Based on duration
    
    @Published var learnedDates: [Date: Bool] = [:]
    @Published var frozenDates: [Date: Bool] = [:]

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
        let today = Calendar.current.startOfDay(for: Date())
        learnedDates[today] = true
        frozenDates[today] = false // Remove freeze if it exists
        streakCount += 1
        print("Logged Learned Day") // Debug print
    }

    func freezeDay() {
        let today = Calendar.current.startOfDay(for: Date())
        frozenDates[today] = true
        learnedDates[today] = false // Remove learned log if it exists
        frozenDays += 1
        print("Logged Freeze Day") // Debug print
    }
}

