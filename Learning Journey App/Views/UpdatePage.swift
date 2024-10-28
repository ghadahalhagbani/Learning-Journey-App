//
//  UpdatePage.swift
//  Learning Journey App
//
//  Created by Ghadah Alhagbani on 25/04/1446 AH.
//

import SwiftUI

struct UpdatePage: View {
    @ObservedObject private var viewModel = UpdatePageViewModel()
    
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 12){
            VStack (alignment: .leading, spacing: 0){
                Text("I want to learn")
                    .foregroundColor(.white)
                    .font(.headline)
                TextField("swift", text: $viewModel.goal)
                    .padding()
                    .foregroundColor(.white)
                    .accentColor(.orange)
                Divider()
            }
                VStack(alignment: .leading, spacing: 12) {
                        Text("I want to learn it in a")
                            .foregroundColor(.white)
                            .font(.headline)
                        
                    HStack(spacing: 12) {
                        ForEach(["Week", "Month", "Year"], id: \.self) { duration in
                            Button(action: {
                                viewModel.selectedDuration = duration
                            }) {
                                Text(duration)
                                    .font(.system(size: 16))
                                    .frame(width: 68, height: 37)
                                    .background(viewModel.selectedDuration == duration ? Color.orange : Color.gray.opacity(0.3))
                                    .cornerRadius(8)
                                    .foregroundColor(viewModel.selectedDuration == duration ? Color.black : Color.orange)
                            }
                        }
                        
                       /*
                        Button(action: {
                            selectedDuration = "Week"
                        }) {
                            Text("Week").font(.system(size:16))
                                .frame(width: 68, height:37)
                                .background(selectedDuration == "Week" ? Color.orange : Color.gray.opacity(0.3))
                                .cornerRadius(8)
                                .foregroundColor(selectedDuration == "Week" ? Color.black : Color.orange)
                        }
                        Button(action: {
                            selectedDuration = "Month"
                        }) {
                            Text("Month").font(.system(size:16))
                                .frame(width: 68, height:37)
                                .background(selectedDuration == "Month" ? Color.orange : Color.gray.opacity(0.3))
                                .cornerRadius(8)
                                .foregroundColor(selectedDuration == "Month" ? Color.black : Color.orange)
                        }
                        Button(action: {
                            selectedDuration = "Year"
                        }) {
                            Text("Year").font(.system(size:16))
                                .frame(width: 68, height:37)
                                .background(selectedDuration == "Year" ? Color.orange : Color.gray.opacity(0.3))
                                .cornerRadius(8)
                                .foregroundColor(selectedDuration == "Year" ? Color.black : Color.orange)
                        }
                    */
                    }
                    }
                    Spacer()
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                // Back action here
                            }) {
                                Image(systemName: "chevron.backward")
                                    .font(.system(size: 17,weight: .medium))
                                    .foregroundColor(.orange)
                                Text("Back")
                                    .font(.system(size: 17))
                                    .foregroundColor(.orange)
                                    .accentColor(.orange)
                            }
                        }
                        ToolbarItem(placement: .principal) {
                            Text("Learning goal")
                                .font(.system(size: 17,weight: .semibold))
                                .foregroundColor(.white)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                // Update action
                                viewModel.updateGoal()
                            }) {
                                Text("Update")
                                    .font(.system(size: 17,weight: .semibold))          .foregroundColor(.orange)
                            }
                        }
                    }
            }
            
            .padding()
        }
    }
}

#Preview {
    UpdatePage()
        .environmentObject(UserData())
}
