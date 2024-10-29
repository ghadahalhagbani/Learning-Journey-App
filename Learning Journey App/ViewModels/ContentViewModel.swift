//
//  ContentViewModel.swift
//  Learning Journey App
//
//  Created by Ghadah Alhagbani on 25/04/1446 AH.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var goal: String = ""
    @Published var selectedDuration: String = ""
    
    
    func startLearning(userData: UserData) {
        userData.goal = goal
        userData.selectedDuration = selectedDuration
    }
}


class HomePageViewModel: ObservableObject {
    @Published var isTodayLearned: Bool = false
    @Published var isTodayFrozen: Bool = false
    
    func updateStreakAndFreeze(userData: UserData) {
        // Reset streak after 32 hours
        if userData.timeSinceLastLearned > (32 * 60 * 60) {
            userData.resetStreak()
            
        }
    }
    
    func logLearnedDay(userData: UserData) {
        print("is call")
        let today = Calendar.current.startOfDay(for: Date())
        userData.logLearnedDay()
        isTodayLearned = true
        isTodayFrozen = false
    }
    
    func freezeDay(userData: UserData) {
        print("is call")
        let today = Calendar.current.startOfDay(for: Date())
        userData.freezeDay()
        isTodayFrozen = true
        isTodayLearned = false
    }
    
    // Reset streak when the duration or goal is updated
    func resetOnGoalOrDurationChange(userData: UserData) {
        userData.resetStreak()
        userData.updateFreezeLimit()
    }
}




class UpdatePageViewModel: ObservableObject {
    @Published var goal: String = ""
    @Published var selectedDuration: String = ""

    func updateGoal(userData: UserData) {
        userData.goal = goal
        userData.selectedDuration = selectedDuration
    }
}


