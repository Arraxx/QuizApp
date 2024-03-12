//
//  LandingView.swift
//  WysaAssignment
//
//  Created by Palak on 11/03/24.
//

import SwiftUI

struct LandingView: View {
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Quiz")
                    .bold()
                    .font(.system(size: 40))
                    .padding()
                
                Spacer()
                
                HStack(spacing : 10){
                    NavigationLink(destination: QuestionsDisplayView(type: "medium")) {
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 150, height : 90)
                            .foregroundStyle(Color.yellow)
                            .overlay(
                                Text("Medium")
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundStyle(Color.white)
                            )
                            .accessibility(label: Text("Medium difficulty quiz"))
                    }
                    
                    NavigationLink(destination: QuestionsDisplayView(type: "easy")) {
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 150, height : 90)
                            .foregroundStyle(Color.green)
                            .overlay(
                                Text("Easy")
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundStyle(Color.white)
                            )
                            .accessibility(label: Text("Easy difficulty quiz"))
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LandingView()
}
