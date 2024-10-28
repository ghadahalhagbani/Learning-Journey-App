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
    @EnvironmentObject var userData: UserData

    func startLearning() {
        userData.goal = goal
        userData.selectedDuration = selectedDuration
    }
}


class HomePageViewModel: ObservableObject {
    @EnvironmentObject var userData: UserData
    
    func logLearnedDay() {
        userData.learnedDays += 1
    }
    
    func freezeDay() {
        userData.frozenDays += 1
    }
}


class UpdatePageViewModel: ObservableObject {
    @Published var goal: String = ""
    @Published var selectedDuration: String = ""
    @EnvironmentObject var userData: UserData

    func updateGoal() {
        userData.goal = goal
        userData.selectedDuration = selectedDuration
    }
}

