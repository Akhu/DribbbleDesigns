//
//  ContentView.swift
//  DribbbleDesigns
//
//  Created by Anthony Da cruz on 30/04/2021.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ContentView: View {
    let cornerRadius : CGFloat = 50.0
    var body: some View {
        VStack {
            HStack {
                GeometryReader { geometry in
                    VStack {
                        RoundedRectangle(cornerRadius: 200).frame(height: 3)
                        RoundedRectangle(cornerRadius: 200).frame(width: 22, height: 3)
                    }
                    .foregroundColor(.lightBeige)
                }.frame(width: 28, height: 28)
                Spacer()
                Image("profileImage")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .scaledToFit()
                    .clipShape(Circle())
            }
            .padding(.horizontal, 32)
            VStack(alignment: .leading) {
                Text("SURF")
                    .font(.custom("Poppins-Bold", size: 32))
                    .foregroundColor(.black)
                HStack {
                    Text("Training program")
                        .font(.custom("Poppins-Regular", size: 16))
                        .foregroundColor(.beigeGrey)
                    Spacer()
                    Text("12 weeks")
                        .font(.custom("Poppins-SemiBold", size: 14))
                        .foregroundColor(.beigeGrey)
                }
            }
            .padding()
            TrainingProgramSlider(cornerRadius: cornerRadius)
                .padding(32)
            
            VStack {
                HStack {
                    Image(systemName: "house.fill")
                        .foregroundColor(.customYellow)
                    Spacer()
                    Image(systemName: "binoculars.fill")
                    Spacer()
                    Image(systemName: "video.fill")
                    Spacer()
                    Image(systemName: "person.fill")
                }
                .foregroundColor(.gray)
                .padding(.horizontal, 70)
            }
            .frame(height: 100)
            .background(Color.white)
            .cornerRadius(35, corners: .topLeft)
            .cornerRadius(35, corners: .topRight)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0.0, y: -2)
            
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")
    }
}

struct TrainingProgramSlider: View {
    let cornerRadius : CGFloat
    @State var isTrainingProgramPresented = false
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                Image("surf1")
                    .resizable()
                    .frame(width: geometry.size.width - 80 , height: geometry.size.height)
                    .overlay(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0.05)]), startPoint: .bottom, endPoint: .top))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                Image("surf3")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width - 40, height: geometry.size.height - 20)
                    .overlay(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0.05)]), startPoint: .bottom, endPoint: .top))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                Image("surf2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height - 40)
                    .overlay(RadialGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0)]), center: .bottom, startRadius: 5, endRadius: 500))
                        
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                    .overlay(
                        
                        VStack(alignment: .leading) {
                                Text("WEEK 1")
                                    .font(.custom("Poppins-Bold", size: 28))
                                    .foregroundColor(.white)
                                Text("3 trainings")
                                    .font(.custom("Poppins-Medium", size: 12))
                                    .foregroundColor(.white)
                                ProgressView(value: 0.3)
                                    .progressViewStyle(LinearProgressViewStyle(tint: Color.customYellow))
                                    
                            }
                            .frame(alignment: .bottom)
                            .padding([.bottom, .horizontal], 48)
                        
                        
                        , alignment: .bottom )
                    .popover(isPresented: $isTrainingProgramPresented, content: {
                        TrainingView()
                    })
                    .onTapGesture {
                        self.isTrainingProgramPresented.toggle()
                    }
                    
            }
        }
    }
}


