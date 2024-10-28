//
//  UserData.swift
//  Learning Journey App
//
//  Created by Ghadah Alhagbani on 25/04/1446 AH.
//

import Foundation

class UserData: ObservableObject {
    @Published var goal: String = "Default Goal"
    @Published var selectedDuration: String = "Default Duration"
    @Published var learnedDays: Int = 0
    @Published var frozenDays: Int = 0
}
