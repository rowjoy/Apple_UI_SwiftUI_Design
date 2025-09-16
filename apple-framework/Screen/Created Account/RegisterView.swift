//
//  RegisterView.swift
//  apple-framework
//
//  Created by Jamirul Islam on 9/9/25.
//

import SwiftUI

struct RegisterView: View {
    enum Field : Hashable {case fullName, email, password, confirmPassword}
    @State private var fullName = ""
    @State private var email = ""
    @State private var Password = ""
    @State private var confirmPassword = ""
    @StateObject private var keyboard = KeyboardObserver()
    @FocusState private var isFocusedField: Field?
    var body: some View {
        ZStack {
            ViewBackgroud()
            ZStack{
                ScrollView {
                    VStack () {
                        AppMainLogo()
                        Text("Crate account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("Sign up to get started")
                            .font(.body)
                            .foregroundColor(.gray)
                        
                        TestFormView { validate in
                            IconTextField(
                                systemImage: "person.fill",
                                placeholder: "Full name",
                                isSecureTextEntry: false,
                                text: $fullName,
                                submitLabel: .next,
                            )
                            .validate{
                                !fullName.isEmpty
                            }
                            .focused($isFocusedField, equals: .fullName)
                            .onSubmit {isFocusedField = .email}
                            .padding(.bottom, 10)
                            IconTextField(
                                systemImage: "envelope.badge.shield.half.filled",
                                placeholder: "Email",
                                isSecureTextEntry: false,
                                text: $email,
                                submitLabel: .next
                            )
                            .validate{
                                email.count > 10
                            }
                            .focused($isFocusedField, equals: .email)
                            .onSubmit {isFocusedField = .password}
                            .padding(.bottom, 10)
                            IconTextField(
                                systemImage: "lock",
                                placeholder: "password",
                                isSecureTextEntry: true,
                                text: $Password,
                                submitLabel: .next,
                            )
                            .validate{
                                Password.count > 6
                            }
                            .focused($isFocusedField, equals: .password)
                            .onSubmit {isFocusedField = .confirmPassword}
                            .padding(.bottom, 10)
                            IconTextField(
                                systemImage: "lock",
                                placeholder: "Confirm password",
                                isSecureTextEntry: true,
                                text: $confirmPassword,
                                submitLabel: .done
                            )
                            .validate{
                                confirmPassword == Password
                            }
                            .focused($isFocusedField, equals: .confirmPassword)
                            .onSubmit {isFocusedField = nil}
                            
                        }
                        .scrollContentBackground(.hidden)
                        .scrollDisabled(false)
                        .formStyle(.columns)
                        .padding(.bottom)
                        .onAppear{isFocusedField = .fullName}
                            CustomButton(
                                buttonName: "Create account",
                                action: {
                                    print("Hello");
                                },
                            )
                            .padding(.bottom)
                        
                            ORDivider()
                                .padding(.bottom)
                            IconOutlineButton()
                                .padding(.bottom)
                            IconInLineButton()
                            .padding(.bottom)
                        HStack {
                            Text("Already have an account?")
                                .foregroundColor(.gray)
                            Text("Login")
                                .foregroundColor(.blue)
                                .onTapGesture {
                                   print("You try login")
                                }
                        }
                        
                    }
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .cornerRadius(20)
            .padding(10)
            .animation(.easeInOut, value: keyboard.isKeyboardVisible) //
 
        }
    }
}








#Preview {
    RegisterView()
}



struct ORDivider: View {
    var body: some View {
        HStack {
            Divider()
                .frame(width: 100, height: 1,)
                .background(Color.gray)
            
            Text("OR")
                .foregroundColor(.gray)
                .padding(.horizontal, 8)
            
            Divider()
                .frame( width: 100, height: 1)
                .background(Color.gray)
        }
    }
}

struct AppMainLogo : View {
    var body: some View {
        Image(systemName: "lock")
            .resizable()
            .scaledToFit()
            .foregroundColor(.white)
            .frame(width: 40, height: 40)
            .padding()
            .background(Gradient(colors: [Color("re-bgcolor2").opacity(0.7), Color("re-bgcolor1").opacity(0.7)]))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ViewBackgroud: View {
    var body: some View {
        LinearGradient(
            colors: [Color("re-bgcolor2").opacity(0.7), Color("re-bgcolor1").opacity(0.7)],
            startPoint: .topTrailing,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea(.all)
    }
}
