//
//  QuestionsDisplayView.swift
//  WysaAssignment
//
//  Created by Palak on 12/03/24.
//

import SwiftUI

struct QuestionsDisplayView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var data : [result] = []
    var type : String
    @State var score : Int = 0
    @State var index : Int = 0
    var body: some View {
        VStack{
            VStack{
                Text("\(type.uppercased()) QUESTIONS")
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                HStack {
                    Spacer()
                    Text("Score : \(score)")
                        .bold()
                        .padding()
                }
            }
            
            Spacer()
            
            if(!data.isEmpty && index < data.count){
                Text("Ques: \(data[index].question)")
                    .bold()
                    .font(.system(size: 18))
                    .padding()
                
                Button(action : {
                    score += 1
                    index += 1
                }){
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 250, height : 40)
                        .foregroundStyle(Color.blue)
                        .overlay(
                            Text(data[index].correctAnswer)
                                .font(.system(size: 20))
                                .bold()
                                .foregroundStyle(Color.white)
                        )
                        .accessibility(label: Text("Correct Answer: \(data[index].correctAnswer)"))
                }
                ForEach(data[index].incorrectAnswer, id : \.self) { val in
                    Button(action : {
                        score -= 1
                        index += 1
                    }){
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 250, height : 40)
                            .foregroundStyle(Color.blue)
                            .overlay(
                                Text(val)
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundStyle(Color.white)
                            )
                            .accessibility(label: Text("Incorrect Answer: \(val)"))
                    }
                }
                
            } else {
                Text("Your score is: \(score)")
                    .bold()
                    .font(.title)
                    .accessibility(label: Text("Your score is: \(score)"))

                Button(action:{
                    presentationMode.wrappedValue.dismiss()
                }){
                    RoundedRectangle(cornerRadius : 25.0)
                        .frame(width: 150, height : 90)
                        .foregroundStyle(.green)
                        .overlay(
                            Text("Exit")
                                .font(.system(size: 20))
                                .bold()
                                .foregroundStyle(Color.white)
                        )
                        .accessibility(label: Text("Exit"))
                }
                
            }
            
            
            Spacer()
            
        }
        .task {
            DispatchQueue.main.async {
                NetworkOperations.shared.fetchAPI { val in
                    for temp in val.results{
                        if(temp.difficulty == type){
                            data.append(temp)
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    QuestionsDisplayView(type : "medium")
}
