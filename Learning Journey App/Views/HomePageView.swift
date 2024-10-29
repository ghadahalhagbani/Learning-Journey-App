//
//  HomePageView.swift
//  Learning Journey App
//
//  Created by Ghadah Alhagbani on 19/04/1446 AH.
//

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var userData: UserData
    @StateObject  var viewModel = HomePageViewModel()
    //OBSERVED
    
        @State private var learnedDates: [Date: Bool] = [:]
        @State private var frozenDates: [Date: Bool] = [:]
    
    var body: some View {
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text(getFormattedDate(Date()))
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                    //.padding(.trailing, 240.0)
                    
                    Text("Learning \(userData.goal)")
                        .font(.system(size: 32))
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
                CalendarView(learnedDates: learnedDates, frozenDates: frozenDates)
            }
            .padding()
        //Log Today as Learned Button
            VStack{
                Button(action: {
                    
                    print("is pressed")
                    viewModel.logLearnedDay(userData: userData)
                    learnedDates[Calendar.current.startOfDay(for: Date())] = true
                    
                }) {
                    ZStack{
                        Circle()
                            .fill(viewModel.isTodayLearned ? Color.learnedCO : viewModel.isTodayFrozen ? Color.freezedCo : Color.orange)
                            .frame(width: 320, height: 320)
                        Text(viewModel.isTodayLearned ? "Learned Today" : viewModel.isTodayFrozen ? "Day Freezed" : "Log Today as Learned")
                            .font(.system(size:41,weight: .semibold))
                            .foregroundColor(viewModel.isTodayLearned ? Color.orange : viewModel.isTodayFrozen ? Color.blue : .black)
                            .padding(.horizontal,90)
                            .bold()
                    }
                }                    .disabled(viewModel.isTodayFrozen || viewModel.isTodayLearned)

                //Freeze Day Button
                Button(action: {
                    viewModel.freezeDay(userData: userData)
                    frozenDates[Calendar.current.startOfDay(for: Date())] = true
                }) {
                    ZStack{
                        Rectangle()
                            .fill(viewModel.isTodayFrozen || viewModel.isTodayLearned ? Color.gray5 : Color.freezeB)
                            .frame(width: 160, height: 50)
                            .cornerRadius(8)
                        Text("Freeze day")
                            .foregroundColor(viewModel.isTodayFrozen || viewModel.isTodayLearned ? .freezeGrey : .blue)
                            .bold()
                    }
                }
                .disabled(viewModel.isTodayLearned || viewModel.isTodayFrozen)
                Text("\(userData.frozenDays) out of \(userData.freezeLimit) freezes used")
                    .foregroundColor(.gray3)
                
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

