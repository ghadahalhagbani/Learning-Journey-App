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
    
    func logLearnedDay(userData: UserData) {
        userData.learnedDays += 1
    }
    
    func freezeDay(userData: UserData) {
        userData.frozenDays += 1
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


