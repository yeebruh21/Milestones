//
//  AddSteppingstoneView.swift
//  Milestones App
//
//  Created by Anthony Chen on 2022-06-21.
//

/*import SwiftUI

struct AddSteppingStoneView: View {
    @EnvironmentObject var steppingstones: Steppingstone
        
        @State private var newName: String = ""
        @State private var description: String = ""
        @State private var cycles: Int = 1
        
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
                                steppingstones.addSteppingstone = false
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
                            Text("Add Stepping Stone")
                                .foregroundColor(.black)
                                .font(Font.custom("Lato", size: 25))
                            VStack() {
                                TextField("Stepping Stone Name", text: $newName)
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
                                    Text("Cycles:")
                                    Picker(selection: $cycles, label: Text("")) {
                                        ForEach(1 ..< 12) { index in
                                            if index-1 != 0 {
                                                Text(String(index-1))
                                            }
                                        }
                                    }
                                    .frame(width: 40, height: 40)
                                    .clipped()
                                }
                                
                                Button(action: {
                                    if newName.count <= 30 && description.count <= 100 && newName != "" {
                                        if !steppingstones.name.isEmpty {
                                         steppingstones.name.insert(newName, at: steppingstones.buttonIndex)
                                         steppingstones.descriptions.insert(description, at: steppingstones.buttonIndex)
                                         steppingstones.cycles.insert(cycles, at: steppingstones.buttonIndex)
                                         steppingstones.addSteppingstone = false
                                     }
                                     else {
                                         steppingstones.name.append(newName)
                                         steppingstones.descriptions.append(description)
                                         steppingstones.cycles.append(cycles)
                                         steppingstones.addSteppingstone = false
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
                    .frame(width: geometry.size.width - 150, height: geometry.size.height - 540)
                }
            }
        }
}

struct AddSteppingStoneView_Previews: PreviewProvider {
    static var previews: some View {
        AddSteppingStoneView()
    }
}
*/
