//
//  ContentView.swift
//  Learning Journey App
//
//  Created by Ghadah Alhagbani on 17/04/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = ContentViewModel()
    
    
    var body: some View {
        NavigationView{
            VStack (spacing: 30){
                //fire icon
                Text("🔥")
                    .font(.system(size:52))
                    .background(Circle().fill(Color.gray.opacity(0.3))
                        .frame(width: 118, height: 118))
                
                    .padding()
                
                HStack{ //fake hstack
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Hello Learner!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("This app will help you learn everyday")
                            .foregroundColor(.gray)
                        
                        
                    }
                    Spacer()
                }
                HStack{ //fake hstack
                    VStack(alignment: .leading, spacing: 0) {
                        
                        
                        Text("I want to learn")
                            .foregroundColor(.white)
                            .font(.headline)
                        
                        TextField("swift", text: $viewModel.goal)
                            .padding()
                            .foregroundColor(.white)
                            .accentColor(.orange)
                        Divider()
                    }
                    Spacer()
                }
                HStack{ //fake hstack
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
                        }
                        /* Button(action: {
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
                         }*/
                        
                        Spacer()
                    }
                }
                NavigationLink(destination: HomePageView().environmentObject(viewModel.userData))
                {
                    Text("Start →")
                        .font(.system(size:16))
                        .frame(width: 151, height:52)
                        .background(Color.orange)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        
                }
                .onTapGesture {
                    viewModel.startLearning()
                }
                .padding()
                
                
            }
            
            .padding()
        }
        
    }
}







#Preview {
    ContentView()
        .environmentObject(UserData())
}
