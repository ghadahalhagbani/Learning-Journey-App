//
//  HomePageView.swift
//  Learning Journey App
//
//  Created by Ghadah Alhagbani on 19/04/1446 AH.
//

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject private var viewModel = HomePageViewModel()
    
    var body: some View {
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text(getFormattedDate(Date()))
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                    //.padding(.trailing, 240.0)
                    
                    Text("Learning \(userData.goal)")                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
                Spacer()
                NavigationLink(destination: UpdatePage().environmentObject(userData)){
                    Text("🔥")
                        .font(.system(size: 24))
                        .background(Circle().fill(Color.gray.opacity(0.3)).frame(width: 44, height: 44))
                }
            }
            .padding()
            VStack{
                CalendarView()
            }
            .padding()
            VStack{
                Button(action: {
                    viewModel.logLearnedDay(userData: userData)
                }) {
                    ZStack{
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 300, height: 300)
                        Text("Lod today as Learned")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .padding(.horizontal,100)
                            .bold()
                    }
                }
                Button(action: {
                    viewModel.freezeDay(userData: userData)
                }) {
                    ZStack{
                        Rectangle()
                            .fill(Color.freezeB)
                            .frame(width: 160, height: 50)
                            .cornerRadius(8)
                        Text("Freeze day")
                            .foregroundColor(.blue)
                            .bold()
                    }
                }
                Text("\(userData.frozenDays) out of 6 freezes used")
                    .foregroundColor(.gray.opacity(0.4))
                
            }
        .navigationBarBackButtonHidden(true)
    }
}
/*
        // Log Button
        private var logButton: some View {
            Button(action: {
                // Action to log the day as learned
            }) {
                Text("Log today as Learned")
                    .font(.system(size:41,weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 350, height: 350)
                    .background(Color.orange)
                    .clipShape(Circle())
            }
            .padding(.top, 20)
        }
 */
private func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM yyyy" // Display month and year
    return formatter.string(from: date)
}

private func getFormattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, dd MMM" // Format: Day of week, day, month
    return formatter.string(from: date)
}





#Preview {
    HomePageView()
        .environmentObject(UserData())
}

