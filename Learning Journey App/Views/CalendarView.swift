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
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(width:390 ,height: 210)
                    .cornerRadius(13)
                    .overlay(
                        RoundedRectangle(cornerRadius: 13)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                VStack{
                    HStack {
                        HStack {
                            Text(formattedDate(date))
                                .font(.system(size: 17, weight: .semibold))
                        }
                        Spacer()
                        HStack(spacing: 28) {
                            Button(action: {
                                // Move to the previous week
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
                    .padding(.horizontal, 15)
                    .padding(.bottom, 8.0)
                    
                    HStack{
                        LazyVGrid(columns: Array(columns.prefix(7)), content: {
                            ForEach(0..<7, id: \.self) { index in
                                let calendar = Calendar.current
                                let weekStart = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date))!
                                let day = calendar.date(byAdding: .day, value: index, to: weekStart)!
                                VStack(spacing: 16) {
                                    Text(daysOfWeek[index])
                                        .font(.system(size: 13,weight: .semibold))
                                        .foregroundColor(day == Calendar.current.startOfDay(for: Date()) ? Color.white : Color.gray.opacity(0.3))
                                    Text(day.formatted(.dateTime.day()))
                                        .foregroundColor(day == Calendar.current.startOfDay(for: Date()) ? Color.orange : Color.white)
                                }
                            }
                        })
                        .padding(.horizontal, 8)
                    }
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width:370 ,height: 1)
                        .padding([.top, .leading, .trailing], 10.0)
                    HStack(spacing: 60){
                        VStack{
                            HStack{
                                Text("10🔥")
                                    .font(.system(size: 24,weight: .semibold))
                            }
                            Text("Day streak")
                                .foregroundColor(Color.gray.opacity(0.4))
                                .font(.system(size: 16))
                        }
                        Rectangle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: 1, height: 70)
                        VStack{
                            HStack{
                                Text("2🧊")
                                    .font(.system(size: 24,weight: .semibold))
                            }
                            Text("Day Freezed")
                                .foregroundColor(Color.gray.opacity(0.4))
                                .font(.system(size: 16))
                        }
                    }
                    .padding(.top,-2)
                }
            }
            .onAppear() {
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
    
    private func getFormattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMM" // Format: Day of week, day, month
        return formatter.string(from: date)
    }
}





#Preview {
    CalendarView()
}
