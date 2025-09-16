//
//  IconTextField.swift
//  apple-framework
//
//  Created by Jamirul Islam on 11/9/25.
//

import SwiftUI

struct IconTextField: View {
    let systemImage: String
    let placeholder: String
    var keyboardType: UIKeyboardType = .default
    var isSecureTextEntry: Bool = false
    @Binding var text : String
    @State private var isSecure: Bool = true
    var submitLabel : SubmitLabel = .done
    var body: some View {
        FieldContainer {
            HStack {
                LeadingIcon(systemName: systemImage)
                Group {
                    if isSecure  && isSecureTextEntry {
                        SecureField(
                            "",
                            text: $text,
                            prompt: Text(placeholder)
                                .foregroundColor(.gray)
                            )
                            .keyboardType(keyboardType)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .font(.system(size: 17, weight: .none, design: .default))                            .foregroundColor(.black)
                            .submitLabel(submitLabel)                        
                    } else {
                        TextField("",
                                  text: $text,
                                  prompt: Text(placeholder)
                            .foregroundColor(.gray)
                        )
                        
                            .keyboardType(keyboardType)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .font(.system(size: 17, weight: .regular, design: .default))
                            .foregroundColor(.black)
                            .submitLabel(submitLabel)
         
                    }
                    if isSecureTextEntry {
                        Button {
                            isSecure.toggle()
                            print(isSecure);
                        } label: {
                            Image(systemName: isSecure ? "eye" : "eye.slash")
                                .foregroundStyle(.gray)
                                .font(.system(size: 18, weight: .regular))
                                .padding(.horizontal, 4)
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel(isSecure ? "Show password" : "Hide password")

                    }

                }
            }
        }
        
    }
}

#Preview {
    IconTextField(
        systemImage: "lock",
        placeholder: "Password",
        keyboardType: .namePhonePad,
        isSecureTextEntry: false,
        text: .constant(""),
        
    )
}




 // MARK: - Shared Field Container Style

struct FieldContainer<Content: View>: View {
    @ViewBuilder var content : Content
    var body : some View {
        if #available(iOS 17.0, *) {
            content
                .frame(height: 45)
                .padding(.horizontal, 12)
                .background(
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(Color.gray, lineWidth: 1)
                        .fill(Color.white)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .shadow(radius: 0, x: 0, y: 0)
        } else {
            // Fallback on earlier versions
            content
                .frame(height: 45)
                .padding(.horizontal,12)
                .background(
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                                        .fill(Color.white)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                                       .stroke(Color.gray, lineWidth: 1)
                )
                .shadow(radius: 0, x: 0, y: 0)
        }
    }
}


// MARK: - Small rounded icon capsule (like your screenshot)

struct LeadingIcon: View {
    let systemName: String

    var body: some View {
        ZStack {
//            RoundedRectangle(cornerRadius: 10, style: .continuous)
//                .fill(Color(.gray).opacity(0.0))
            Image(systemName: systemName)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.blue)
                .frame(width: 25, height: 25)
        }
        .frame(width: 34, height: 34)
    }
}


// MARK: - Custom text field

struct MyTextFieldStyle : TextFieldStyle {
    func _body (configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 5,style: .continuous)
                    .stroke(Color.gray, lineWidth: 1)
            )
            
        
    }
}



// Let’s see how we can define a custom preference key first.

/* Doc link https://medium.com/@mhmtkrnlk/how-to-validate-textfields-in-swiftui-like-a-pro-3dbe368d1570
*/
struct ValidationPreferenceKey: PreferenceKey {
    static var defaultValue: [Bool] = []
    static func reduce(value: inout [Bool], nextValue: () -> [Bool]) {
        value += nextValue()
    }
}


/*
 
 This modifier registers the key to that particular view.
 
 For example, let's say we have TabView and multiple child-view inside of it and all of them have a .id() modifier. This reduce function is used for all of that id modifiers value.

 To use this on TextField we need two more steps

 1- ViewModifer

 2- Extension

 Let me show you how to implement ViewModifer for this
 
*/


struct ValidationModifier: ViewModifier {
    let validation : () -> Bool
    func body(content : Content) -> some View {
        content.preference(
            key: ValidationPreferenceKey.self,
            value: [validation()]
        )
    }
}



/*
 
 This variable gonna hold the logic we are gonna use for validation.

 And this extension constrains this only for certain types of Views such as TextFields and SecureFields.
 
*/


extension IconTextField {
    func validate(_ flag : @escaping () -> Bool) -> some View{
        self.modifier(ValidationModifier(validation: flag))
    }
}


extension SecureField {
    func validate (_ flag : @escaping () -> Bool) -> some View{
        self.modifier(ValidationModifier(validation: flag))
    }
}



struct TestFormView<Content : View> : View {
    @State var validationSeeds : [Bool] = []
    @ViewBuilder var content : ((@escaping () -> Bool)) -> Content
    
    var body : some View {
        content (validate)
            .onPreferenceChange(ValidationPreferenceKey.self) { value in
                validationSeeds = value
            }
    }
    
    private func validate () -> Bool {
        for seed in validationSeeds {
            if !seed {return false}
        }
        return true
    }
}







