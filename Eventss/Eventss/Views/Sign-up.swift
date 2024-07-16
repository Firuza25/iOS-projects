//
//  Sign-up.swift
//  Eventss
//
//  Created by Firuza on 07.05.2024.
//

import SwiftUI

struct Sign_up: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @Environment(\.presentationMode) var dismiss
    
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading,spacing: 40, content: {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss.wrappedValue.dismiss()
                    }
                
                VStack(alignment: .leading, spacing: 15, content: {
                    
                    Text("Sign-up")
                        .font(.title)
                    
                    
                    Text("Enter your email address and password and continue searching for the events.")
                        .font(.callout)
                })
                
                
                
                VStack(spacing: 15, content: {
                    
                    
                    TextField("User name", text:$username)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .overlay{
                            Capsule()
                                .stroke(.gray.opacity(0.8), lineWidth: 0.5)
                        }
                    
                    
                    TextField("Email Address", text:$email)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .overlay{
                            Capsule()
                                .stroke(.gray.opacity(0.8), lineWidth: 0.5)
                        }
                    
                    
                    SecureField("Password", text:$password)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .overlay{
                            Capsule()
                                .stroke(.gray.opacity(0.8), lineWidth: 0.5)
                        }
                })
                
                
                
                
                Spacer()
                
                
                
                VStack(spacing: 15, content: {
                    Button{
                        
                    }label: {
                        Text("Continue")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.purple)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    
                    NavigationLink{
                        Sign_In()
                    }label: {
                        Text("Already have an account? **Sign-in**")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    }
                    .foregroundStyle(.black)
                    
                })
            })
            .padding()
            .preferredColorScheme(.dark)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    Sign_up()
}
