//
//  MilestonesView.swift
//  Milestones App
//
//  Created by Anthony Chen on 2022-06-10.
//

import SwiftUI
import Foundation

/// Declares text border
struct StrokeText: View {
    /// Text of element
    let text: String
    /// Width of element
    let width: CGFloat
    /// Colour of element
    let color: Color

    /// Sets parameters for element
    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}

/// Creates instance of set of milestones
class Milestone: ObservableObject {
    /// Name of milestones
    @Published var name: [String] = []
    /// Lengths of time
    @Published var length: [Int] = []
    /// Whether trigger for adding milestone is activated
    @Published var addMilestone: Bool = false
    /// Descriptions for all milestones
    @Published var descriptions: [String] = []
    /// Units for time
    @Published var unit: [String] = []
    /// Which index the button is currently at
    @Published var buttonIndex: Int = 0
    // MARK: Continue storage variables
    //@Published var savedName: [String] = UserDefaults.standard.stringArray(forKey: "name") ?? []
    //@Published var savedLength: [Int] = UserDefaults.standard.stringArray(forKey: "length": Int) -> [Int]?
    //@Published var savedDescriptions: [String] = UserDefaults.standard.stringArray(forKey: "description") ?? []
}

/// Directs user to MilestonesView or SteppingstonesView
struct Directions: View {
    /// The index of the current view
    @State var viewNum: Int = 1
    
    /// Redirects user depending on value of viewNum
    var body: some View {
        ZStack {
            if viewNum == 1 {
                MilestonesView(viewNum: $viewNum)
            }
            else if viewNum == 2 {
                SteppingStonesView(viewNum: $viewNum)
            }
        }
        .environmentObject(Milestone())
    }
}

/// Creates instance of Milestone page to display
struct MilestonesView: View {
    /// Whether menu is currently active or not
    @State private var menuOpen: Bool = false
    /// Whether tips are currently visible
    @State private var showHelp: Bool = false
    /// Whether user is currently editing milestones
    @State private var editToggle: Bool = false
    /// Whether milestone description is being shown
    @State private var descriptionToggle: Bool = false
    
    /// Contains instance of milestone class
    @EnvironmentObject var milestones: Milestone
    
    /// Relates view index in MilestonesView to other views
    @Binding var viewNum: Int
    
    /// Switches boolean value for menu trigger
    func openMenu() {
        self.menuOpen.toggle()
    }
    
    /// Inherits classes and functions from View.body and implements in Preview device
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ZStack {
                    
                    // MARK: Custom colour
                    Rectangle()
                        .foregroundColor(Color(red: 151/255, green: 245/255, blue: 234/255))
                        .opacity(0.6)
                        .ignoresSafeArea()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    VStack {
                        Button(action: {
                            self.openMenu()
                        }, label: {
                            HStack {
                                VStack (spacing: 4) {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 31, height: 6)
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 31, height: 6)
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 31, height: 6)
                                }
                                .padding(.leading, 25)
                                Spacer()
                            }
                        })
                        
                        StrokeText(text: "MILESTONES", width: 0.5, color: .black)
                                    .foregroundColor(.white)
                                .font(Font.custom("Lato", size: 45))
                            .shadow(radius: 1)
                            .padding(.bottom, 20)
                            .padding(.top, 10)
                        
                        // MARK: Milestone rectangles
                        ScrollView (showsIndicators: false) {
                            if milestones.name.isEmpty {
                                if !editToggle {
                                    Text("Nothing to see here!")
                                }
                                else {
                                    ZStack {
                                        Circle()
                                            .foregroundColor(Color(red: 70/255, green: 246/255, blue: 119/255))
                                            .frame(width: 40, height: 40)
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .frame(width: 2, height: 20)
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .rotationEffect(.degrees(90))
                                            .frame(width: 2, height: 20)
                                    }
                                    .onTapGesture(count: 1, perform: {
                                        milestones.addMilestone = true
                                    })
                                }
                            }
                            else {
                                VStack {
                                    if editToggle {
                                        ZStack {
                                            Circle()
                                                .foregroundColor(Color(red: 70/255, green: 246/255, blue: 119/255))
                                                .frame(width: 40, height: 40)
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .frame(width: 2, height: 20)
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .rotationEffect(.degrees(90))
                                                .frame(width: 2, height: 20)
                                        }
                                        .onTapGesture(count: 1, perform: {
                                            milestones.addMilestone = true
                                            milestones.buttonIndex = 0
                                        })
                                    }
                                    ForEach (milestones.name.indices, id: \.self) { index in
                                        ZStack {
                                            if milestones.name.indices.contains(index + 1) {
                                                Rectangle()
                                                    .foregroundColor(.black)
                                                    .frame(width: 5, height: self.editToggle ? 70 : 40)
                                                    .offset(y: self.editToggle ? 70 : 60)
                                                    .opacity(0.5)
                                            }
                                            if !milestones.name.indices.contains(index + 1) {
                                                ZStack {
                                                    Rectangle()
                                                        .foregroundColor(.yellow)
                                                        .frame(width: 342, height: 99)
                                                        .shadow(radius: 5)
                                                    Rectangle()
                                                        .foregroundColor(Color(red: 255/255, green: 230/255, blue: 100/255))
                                                        .frame(width: 2, height: 20)
                                                        .rotationEffect(.degrees(45))
                                                        .offset(x: 165, y: -42)
                                                    Rectangle()
                                                        .foregroundColor(Color(red: 255/255, green: 230/255, blue: 100/255))
                                                        .frame(width: 2, height: 20)
                                                        .rotationEffect(.degrees(-45))
                                                        .offset(x: -165, y: -42)
                                                    Rectangle()
                                                        .foregroundColor(Color(red: 255/255, green: 230/255, blue: 100/255))
                                                        .frame(width: 2, height: 20)
                                                        .rotationEffect(.degrees(45))
                                                        .offset(x: -165, y: 42)
                                                    Rectangle()
                                                        .foregroundColor(Color(red: 255/255, green: 230/255, blue: 100/255))
                                                        .frame(width: 2, height: 20)
                                                        .rotationEffect(.degrees(-45))
                                                        .offset(x: 165, y: 42)
                                                    Rectangle()
                                                        .foregroundColor(.white)
                                                        .frame(width: 318, height: 75).onLongPressGesture(minimumDuration: 0.3) {
                                                            self.descriptionToggle = true
                                                        }
                                                }
                                            }
                                            else {
                                                ZStack {
                                                    Text(milestones.descriptions[index])
                                                    Rectangle()
                                                        .foregroundColor(.white)
                                                        .frame(width: 210, height: 65)
                                                }
                                                .onTapGesture {
                                                    self.descriptionToggle = false
                                                }
                                            }
                                            VStack {
                                                Text(milestones.name[index])
                                                    .bold()
                                                Text(String(milestones.length[index]) + " " + milestones.unit[index])
                                            }
                                            if self.descriptionToggle {
                                                ZStack {
                                                    Rectangle()
                                                        .foregroundColor(.white)
                                                        .opacity(0.8)
                                                        .cornerRadius(15)
                                                }
                                            }
                                            
                                            // MARK: Add circles
                                            
                                            if editToggle {
                                                ZStack {
                                                    Circle()
                                                        .foregroundColor(Color(red: 70/255, green: 246/255, blue: 119/255))
                                                        .frame(width: 40, height: 40)
                                                    Rectangle()
                                                        .foregroundColor(.white)
                                                        .frame(width: 2, height: 20)
                                                    Rectangle()
                                                        .foregroundColor(.white)
                                                        .rotationEffect(.degrees(90))
                                                        .frame(width: 2, height: 20)
                                                }
                                                .onTapGesture {
                                                    milestones.addMilestone = true
                                                    milestones.buttonIndex = index + 1
                                                }
                                                .offset(y: milestones.name.indices.contains(index + 1) ? 72 : 80)
                                            }
                                        }
                                        .padding(.bottom, self.editToggle ? 60 : 20)
                                        .animation(Animation.easeIn(duration: 0.4))
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                        HStack {
                            Button(action: {
                                withAnimation {
                                    self.showHelp.toggle()
                                }
                            }, label: {
                                ZStack {
                                    Circle()
                                        .foregroundColor(.white)
                                        .shadow(radius: 5)
                                        .frame(width: 59, height: 59)
                                    Text("?")
                                        .font(Font.custom("Lato", size: 50))
                                }
                                .padding(.leading, 50)
                            })
                            .foregroundColor(.black)
                            Spacer()
                                .frame(width: 100)
                            Button(action: {
                                self.editToggle.toggle()
                            }, label: {
                                if !editToggle {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .shadow(radius: 5)
                                            .frame(width: 87, height: 51)
                                        Text("EDIT")
                                            .font(Font.custom("Lato", size: 21))
                                    }
                                    .padding(.trailing, 50)
                                }
                                else {
                                    ZStack {
                                        Circle()
                                            .foregroundColor(.white)
                                            .shadow(radius: 5)
                                            .frame(width: 59, height: 59)
                                        Rectangle()
                                            .foregroundColor(.red)
                                            .frame(width: 5, height: 40)
                                            .rotationEffect(.degrees(-45))
                                        Rectangle()
                                            .foregroundColor(.red)
                                            .frame(width: 5, height: 40)
                                            .rotationEffect(.degrees(45))
                                    }
                                    .padding(.leading, self.editToggle ? 28 : 0)
                                    .padding(.trailing, 50)
                                }
                            })
                            .foregroundColor(.black)
                        }
                    }
                }
                
                // Side Menu
                ZStack {
                    GeometryReader { _ in
                        EmptyView()
                    }
                    .background(Color.gray.opacity(0.05))
                    .opacity(self.menuOpen ? 1.0 : 0.0)
                    .animation(Animation.easeIn.delay(0.25))
                    .onTapGesture {
                        self.openMenu()
                    }
                    
                    HStack {
                        List {
                            Text("MENU")
                                .bold()
                            Text("MILESTONES").onTapGesture {
                                self.viewNum = 1
                            }
                            Text("STEPPING STONES").onTapGesture {
                                self.viewNum = 2
                            }
                            Text("SETTINGS").onTapGesture {
                                print("SETTINGS")
                            }
                        }
                            .frame(width: 200)
                            .background(Color.white)
                        .offset(x: self.menuOpen ? 0 : -200)
                            .animation(.default)
                        
                        Spacer()
                    }
                }
                
                // MARK: Useful Info
                
                if self.showHelp {
                    GeometryReader { _ in
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .opacity(0.8)
                                .cornerRadius(15)
                            VStack {
                                Text("Useful Info")
                                    .foregroundColor(.black)
                                    .font(Font.custom("Lato", size: 30))
                                ScrollView {
                                    LazyVStack {
                                        Text("Making good goals is a good thing.")
                                    }
                                }
                                .padding(.top, 15)
                            }
                            .padding(.top, 40)
                        }
                        .frame(width: geometry.size.width - 100, height: geometry.size.height - 150)
                        .padding(50)
                    }.background(Color.black.opacity(0.1)
                                    .edgesIgnoringSafeArea(.all)
                                    .onTapGesture {
                                        withAnimation {
                                            self.showHelp.toggle()
                                        }
                                    })
                }
                
                if self.milestones.addMilestone {
                    AddMilestoneView()
                }
            }
        }
    }
}

/* Rectangle()
    .foregroundColor(Color(red: 193/255, green: 235/255, blue: 253/255))
    .opacity(0.6)
    .frame(width: geometry.size.width, height: geometry.size.height) */

/// Initializes preview
struct MilestonesView_Previews: PreviewProvider {
    static var previews: some View {
        Directions()
    }
}
