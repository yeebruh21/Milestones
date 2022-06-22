//
//  SteppingStonesView.swift
//  Milestones App
//
//  Created by Anthony Chen on 2022-06-10.
//

import SwiftUI

struct SteppingStonesView: View {
    @State private var menuOpen: Bool = false
    @State private var showHelp: Bool = false
    
    @Binding var viewNum: Int
    
    func openMenu() {
        self.menuOpen.toggle()
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ZStack {
                    
                    // MARK: Custom colour
                    
                    Rectangle()
                        .foregroundColor(Color(red: 193/255, green: 235/255, blue: 253/255))
                        .opacity(0.6)
                        .ignoresSafeArea()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    VStack {
                        // Menu button
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
                        
                        StrokeText(text: "STEPPING STONES", width: 0.5, color: .black)
                                    .foregroundColor(.white)
                                .font(Font.custom("Lato", size: 35))
                            .shadow(radius: 1)
                            .padding(.bottom, 20)
                            .padding(.top, 15)
                        
                        // MARK: Milestone rectangles
                        ScrollView {
                            LazyVStack {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 318, height: 75)
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .frame(width: 5, height: 48)
                                        .offset(y: 60)
                                        .opacity(0.5)
                                }
                                .padding(.bottom, 20)
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 318, height: 75)
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .frame(width: 5, height: 48)
                                        .offset(y: 60)
                                        .opacity(0.5)
                                }
                                .padding(.bottom, 20)
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 318, height: 75)
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .frame(width: 5, height: 48)
                                        .offset(y: 60)
                                        .opacity(0.5)
                                }
                                .padding(.bottom, 20)
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 318, height: 75)
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .frame(width: 5, height: 48)
                                        .offset(y: 60)
                                        .opacity(0.5)
                                }
                                .padding(.bottom, 20)
                                
                                // Final milestone
                                
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
                                        .frame(width: 318, height: 75)
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
                                // MARK: add third viewNum here when creating settings
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
                                        Text("What Are Milestones?")
                                        Text("\nasdfasdfad")
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
            }
        }
    }
}

