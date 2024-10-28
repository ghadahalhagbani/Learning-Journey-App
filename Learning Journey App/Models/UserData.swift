//
//  UserData.swift
//  Learning Journey App
//
//  Created by Ghadah Alhagbani on 25/04/1446 AH.
//

import Foundation

class UserData: ObservableObject {
    @Published var goal: String = ""
    @Published var selectedDuration: String = ""
    @Published var learnedDays: Int = 0
    @Published var frozenDays: Int = 0
}
