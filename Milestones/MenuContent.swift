//
//  MenuContent.swift
//  Milestones App
//
//  Created by Anthony Chen on 2022-06-10.
//

import SwiftUI

struct SideMenu: View {
    @Binding var viewNum: Int
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.05))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }
                    
            HStack {
                List {
                    Text("MENU")
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
                .frame(width: self.width)
                .background(Color.white)
                .offset(x: self.isOpen ? 0 : -self.width)
                .animation(.default)
                    
                Spacer()
            }
        }
    }
}
