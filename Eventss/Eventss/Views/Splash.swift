//
//  Splash.swift
//  Eventss
//
//  Created by Firuza on 07.05.2024.
//

import SwiftUI

struct Splash: View {
    @State var isActive = false
    
    var body: some View {
        VStack{
            if isActive{
                Onboarding()
            }
            else{
                Text("_E_V_E_N_T_S_")
                    .font(.largeTitle.bold())
            }
        }
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                withAnimation{
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    Splash()
}
