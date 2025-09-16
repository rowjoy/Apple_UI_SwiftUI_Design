//
//  CustomButton.swift
//  apple-framework
//
//  Created by Jamirul Islam on 15/9/25.
//

import SwiftUI

struct CustomButton : View {
    var buttonName : String
    var action : () -> Void = { }
    var backgroundColor : Color = Color("re-bgcolor1")
    var mxHeight : CGFloat = 50
    var cornerRadius : CGFloat = 10
    var foregroundColor : Color = Color.white
    
    var body: some View {
        Button (
            action: action,
        
            label: {
                Text(buttonName)
                    .font(.headline)
                    .foregroundColor(foregroundColor)
                    .frame(maxWidth: .infinity , minHeight: mxHeight)
                    .background(backgroundColor)
                    .cornerRadius(cornerRadius)
            }
        )
    }
}





struct IconOutlineButton : View {
    var body : some View {
        Button (
            action: {
                
            }){
                
                HStack {
                    Image("google")
                        .resizable()
                        .frame(width: 25,height: 25)
                    Text("Sign in with Google")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                }
               .frame(maxWidth: .infinity, minHeight: 50)
               .cornerRadius(5)
               .overlay(
                  RoundedRectangle(cornerRadius: 5)
                    .stroke(style: StrokeStyle(lineWidth: 1,))
                    .fill(Color.gray)
               )
        }
    }
}



struct IconInLineButton : View {
    var body: some View {
        Button (action : {
            print("Hi")
        }){
            
            HStack {
                Image("facebook")
                    .resizable()
                    .frame(width: 25,height: 25)
                Text("Continue with Facebook")
            }
            .foregroundColor(.white)
            .font(.system(size: 16, weight: .semibold))
            .frame(maxWidth: .infinity,minHeight: 50)
            .background(Color.blue)
            .cornerRadius(5)
        }
    }
}




#Preview {
    CustomButton(
        buttonName: "Create Account",
        action: {
            
        }
    )
    
    IconOutlineButton()
    IconInLineButton()
    
    
}
