//
//  CalendarView.swift
//  Learning Journey App
//
//  Created by Ghadah Alhagbani on 22/04/1446 AH.
//

import SwiftUI

struct CalendarView: View {
    @State private var date = Date.now
    let daysOfWeek = Date.capitalizedFirstThreeLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    @State private var days: [Date] = []
    
    var learnedDates: [Date: Bool]
    var frozenDates: [Date: Bool]
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(width:390 ,height: 225)
                    .cornerRadius(13)
                    .overlay(
                        RoundedRectangle(cornerRadius: 13)
                            .stroke(Color.gray3, lineWidth: 1)
                    )
                
                VStack{
                    HStack() {
                        HStack {
                            Text(formattedDate(date))
                                .font(.system(size: 17, weight: .semibold))
                        }
                        Spacer()
                        HStack(spacing: 28) {
                            Button(action: {
                                date = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: date) ?? date
                            }) {
                                Image(systemName: "chevron.backward")
                                    .font(.system(size: 20,weight: .medium))
                                
                                    .foregroundColor(.orange)
                            }
                            Button(action: {
                                // Move to the next week
                                date = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: date) ?? date
                            }) {
                                Image(systemName: "chevron.forward")
                                    .font(.system(size: 20,weight: .medium))
                                    .foregroundColor(.orange)
                            }
                        }
                    }
                    .padding(.all, 10.0)
                    .frame(width: 390.0, height: 30)
                    
                    
                    HStack{
                        LazyVGrid(columns: Array(columns.prefix(7)), content: {
                            ForEach(0..<7, id: \.self) { index in
                                let calendar = Calendar.current
                                let weekStart = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date))!
                                let day = calendar.date(byAdding: .day, value: index, to: weekStart)!
                                let isToday = day == Calendar.current.startOfDay(for: Date())
                                let isLearnedBefore = learnedDates[day] == true
                                let isFrozenBefore = frozenDates[day] == true
                                
                                VStack(spacing: 16) {
                                    
                                    Text(daysOfWeek[index])
                                        .font(.system(size: 13,weight: .semibold))
                                        .foregroundColor(isToday ? Color.white : Color.gray3)
                                    
                                    Text(day.formatted(.dateTime.day()))
                                        .foregroundColor(
                                            isToday
                                                ? (isLearnedBefore ? Color.white : isFrozenBefore ? Color.white : Color.orange)
                                                : (isLearnedBefore ? Color.orange : isFrozenBefore ? Color.blue : Color.white)
                                        )
                                        .frame(width: 44, height: 44)
                                        .background(
                                            Circle()
                                                .fill(
                                                    isToday
                                                    ? (isLearnedBefore ? Color.orange : isFrozenBefore ? Color.blue : Color.clear)
                                                    : (isLearnedBefore ? Color.learnedCO : isFrozenBefore ? Color.freezedCo : Color.clear)
                                                )
                                                .frame(width: 44, height: 44)
                                        )
                                }
                            }
                        })
                        .padding(.horizontal, 8)
                    }
                    Rectangle()
                        .fill(Color.gray3)
                        .frame(width:370 ,height: 1)
                        .padding([.top, .leading, .trailing], 10.0)
                    HStack(spacing: 60){
                        VStack{
                            HStack{
                                Text("10 🔥")
                                    .font(.system(size: 24,weight: .semibold))
                            }
                            Text("Day streak")
                                .foregroundColor(Color.gray3)
                                .font(.system(size: 16))
                        }
                        Rectangle()
                            .fill(Color.gray3)
                            .frame(width: 1, height: 70)
                        VStack{
                            HStack{
                                //Text("2\(UserData.freezeLimit)🧊")
                                Text("2 🧊")
                                    .font(.system(size: 24,weight: .semibold))
                            }
                            Text("Day Freezed")
                                .foregroundColor(Color.gray3)
                                .font(.system(size: 16))
                        }
                    }
                    .padding(.top,-2)
                }
            }
            .onAppear {
                days = date.calendarDisplayDays
            }
            .onChange(of: date) {
                days = date.calendarDisplayDays
            }
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy" // Display month and year
        return formatter.string(from: date)
    }
    
   /* private func getFormattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMM" // Format: Day of week, day, month
        return formatter.string(from: date)
    }*/
}





#Preview {
    let sampleLearnedDates = [
        Calendar.current.startOfDay(for: Date()): true,
        Calendar.current.startOfDay(for: Calendar.current.date(byAdding: .day, value: -1, to: Date())!): true
    ]
    
    let sampleFrozenDates = [
        Calendar.current.startOfDay(for: Calendar.current.date(byAdding: .day, value: -2, to: Date())!): true
    ]
    
    CalendarView(learnedDates: sampleLearnedDates, frozenDates: sampleFrozenDates)
}
