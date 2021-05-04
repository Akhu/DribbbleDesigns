//
//  TrainingView.swift
//  DribbbleDesigns
//
//  Created by Anthony Da cruz on 04/05/2021.
//

import SwiftUI

struct TrainingView: View {
    
    var body: some View {
        VStack{
            VideoPlayer()
            List {
                //Todo
            }
        }
    }
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView()
    }
}

struct VideoPlayer: View {
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("training")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 40,style: .continuous))
                VStack(alignment: .center) {
                    Spacer(minLength: 105)
                    HStack(spacing: 14) {
                        Image(systemName: "backward.end.fill")
                        Image(systemName: "pause.fill")
                            .padding()
                            .background(
                                Circle()
                                    .opacity(0.4)
                                    .padding(6)
                                    .overlay(Circle().opacity(0.3))
                            )
                        Image(systemName: "forward.end.fill")
                    }.font(.title)
                    
                    Spacer()
                    HStack {
                        Text("0:20")
                        ProgressView(value: 0.8)
                            .progressViewStyle(LinearProgressViewStyle(tint: .customYellow))
                        Text("2:59")
                    }.padding(.horizontal, 40)
                    .padding(.vertical, 12)
                }.foregroundColor(.white)
                .overlay(Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(.white.opacity(0.3))
                        .overlay(Image(systemName: "xmark").foregroundColor(.white))
                        .frame(width: 36, height: 36)
                        .padding(.leading, 28)
                        .padding(.top,24)
                }), alignment: .topLeading)
            }
        }.frame(height: 290)
    }
}
