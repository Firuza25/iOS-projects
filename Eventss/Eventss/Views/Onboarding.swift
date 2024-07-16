//
//  Onboarding.swift
//  Eventss
//
//  Created by Firuza on 07.05.2024.
//

import SwiftUI

struct Onboarding: View {
    
    @State private var isActive = false
    @State private var isExpanded = false
    @State private var offset = CGSize.zero
    
    var body: some View {
        if isActive{
            Sign_In()
        }
        else{
            ZStack(alignment: .top){
                VStack{
                    Spacer()
                    
                    Circle()
                        .fill(
                            .radialGradient(colors: [.blue, .clear, .clear, .clear], center: .center, startRadius: 0, endRadius: UIScreen.main.bounds.width)
                        )
                        .scaleEffect(isExpanded ? 20 : 2)
                        .padding(.bottom, -(UIScreen.main.bounds.width / 2))
                }
                
                .frame(height: .infinity)
                .zIndex(isExpanded ? 2 : 0)
                
                
                VStack(spacing: 15, content: {
                    Spacer()
                    
                    Image("eventtext")
                        .resizable()
                        .scaledToFit()
                    
                    
                    Text("Choose how to spend your WEEKENDS")
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    
                    
                    
                    Text("A quality vacation with us is your key to unforgettable events! Tired of a monotonous weekend? Do you need a varied and exciting vacation?Then you're here!")
                        .multilineTextAlignment(.center)
                        .opacity(0.7)
                        .foregroundColor(.white)
                    
                    
                    Spacer()
                    VStack{
                        Image(systemName: "chevron.up")
                        Text("Get Started")
                            .padding(.top)
                            .foregroundColor(.white)
                            
                    }
                    .fontWeight(.medium)
                    
                })
                .opacity(isExpanded ? 0 : 1)
                .offset(offset)
                
            }
            .gesture(DragGesture()
                .onEnded({value in
                    if value.translation.height < 50 {
                        withAnimation(.easeInOut(duration:2)){
                            offset = value.translation
                            isExpanded = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                            withAnimation(){
                                isActive.toggle()
                            }
                            
                        }
                        
                    }})
            )
            
            
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("back")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    Onboarding()
}
