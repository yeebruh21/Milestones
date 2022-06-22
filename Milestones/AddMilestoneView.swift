//
//  AddMilestoneView.swift
//  Milestones App
//
//  Created by Anthony Chen on 2022-06-10.
//

import SwiftUI

struct AddMilestoneView: View {
    @EnvironmentObject var milestones: Milestone
        
        @State private var newName: String = ""
        @State private var description: String = "N/A"
        @State private var length: Int = 1
        @State private var unit: String = "Day(s)"
        
        @State private var units: [String] = ["Day(s)", "Week(s)", "Month(s)", "Year(s)"]
        
        var body: some View {
            GeometryReader { geometry in
                ZStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.2)
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .opacity(0.8)
                            .cornerRadius(15)
                        VStack(spacing: 0) {
                            Button(action: {
                                milestones.addMilestone = false
                            }, label: {
                                HStack {
                                    Rectangle()
                                        .frame(width: 2, height: 15)
                                        .rotationEffect(.degrees(-45))
                                    Rectangle()
                                        .frame(width: 2, height: 15)
                                        .rotationEffect(.degrees(45))
                                        .offset(x: -9.8)
                                    Spacer()
                                        .frame(width: 228)
                                }
                            })
                            .offset(y: -26)
                            .foregroundColor(.black)
                            Text("Add Milestone")
                                .foregroundColor(.black)
                                .font(Font.custom("Lato", size: 30))
                            VStack() {
                                TextField("Milestone Name", text: $newName)
                                    .padding(.bottom, 10)
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                
                                if newName.count > 30 {
                                    Text("Too many characters")
                                        .foregroundColor(.red)
                                        .offset(x: -8)
                                }
                                
                                TextField("Description\n\n\n\n", text: $description)
                                    .padding(.leading, 20)
                                
                                if description.count > 100 {
                                    Text("Too many characters")
                                        .foregroundColor(.red)
                                }
                                
                                HStack {
                                    Picker(selection: $length, label: Text("")) {
                                        ForEach(1 ..< 101) { index in
                                            if index-1 != 0 {
                                                Text(String(index-1))
                                            }
                                        }
                                    }
                                    .frame(width: 40, height: 80)
                                    .clipped()
                                    .padding(.trailing, 20)
                                    
                                    Picker(selection: $unit, label: Text("")) {
                                        ForEach(units, id: \.self) {
                                            Text($0)
                                        }
                                    }
                                    .frame(width: 100, height: 80)
                                    .clipped()
                                }
                                
                                Button(action: {
                                    if newName.count <= 30 && description.count <= 100 && newName != "" {
                                     if milestones.name != [] {
                                         milestones.name.insert(newName, at: milestones.buttonIndex)
                                         milestones.descriptions.insert(description, at: milestones.buttonIndex)
                                         milestones.unit.insert(unit, at: milestones.buttonIndex)
                                         milestones.length.insert(length, at: milestones.buttonIndex)
                                         milestones.addMilestone = false
                                     }
                                     else {
                                         milestones.name.append(newName)
                                         milestones.descriptions.append(description)
                                         milestones.unit.append(unit)
                                         milestones.length.append(length)
                                         milestones.addMilestone = false
                                     }
                                 }
                                }, label: {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(Color(red: 70/255, green: 246/255, blue: 119/255))
                                            .frame(width: 70, height: 40)
                                            .cornerRadius(5)
                                        Text("SAVE")
                                            .font(.custom("Lato", size: 20))
                                    }
                                    .padding(.top, 20)
                                    .foregroundColor(.white)
                                })
                            }
                        }
                        .offset(y: 10)
                    }
                    .frame(width: geometry.size.width - 150, height: geometry.size.height - 500)
                }
            }
        }
}

struct AddMilestoneView_Previews: PreviewProvider {
    static var previews: some View {
        AddMilestoneView()
    }
}
