//
//  LoginView.swift
//  DeliveryApp
//
//  Created by Nguyen Trong Nghia on 18/2/26.
//

import SwiftUI

struct LoginView: View {
    @StateObject var coordinator: LoginCoordinator
    @Environment(\.colorScheme) var colorScheme
    @State var emailStr = ""
    @State var password = ""
    @State var isAcceptforLogin = false
    @State private var errorMessage: String?
    @State private var isLoading = false

    @State private var emailState: FieldState = .normal
    @State private var passwordState: FieldState = .normal
    @State private var emailError: String?
    @State private var passwordError: String?

    var body: some View {
        VStack {
            Asset.Assets.typeSizeSmall.swiftUIImage
                .renderingMode(.template)
                .resizable()
                .frame(width: 70, height: 24,alignment: .center)
                .foregroundStyle(colorScheme == .dark ? Asset.Colors.white.swiftUIColor : Asset.Colors.black.swiftUIColor)
                
            
            Text("Login in to your\naccount")
                .font(FontFamily.Poppins.bold.swiftUIFont(size: 32))
                .multilineTextAlignment(.leading)
                .foregroundStyle(Color.Typography.heading.swiftUIColor)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            TextFieldCommon(
                placeholder: "email address",
                text: $emailStr,
                state: emailState,
                errorMessage: emailError
            )
            .padding(.bottom, 8)

            SecureTextFieldCommon(
                placeholder: "password",
                text: $password,
                state: passwordState,
                errorMessage: passwordError
            )
            .padding(.bottom, 8)

            
            Button {
                
            } label: {
                Text("forgot password")
                    .font(FontFamily.Poppins.bold.swiftUIFont(size: 15))
                    .foregroundStyle(Asset.Colors.primary700.swiftUIColor)
                    .frame(height: 26)
            }
            

            Spacer()
            
            if !isAcceptforLogin {
                Button("Login"){
                    login()
                }
                    .buttonStyle(CustomButtonStyle(type: .disabled, size: .medium))
                    .padding(.bottom,16)
            } else {
                Button("Login"){
                    login()
                }
                .buttonStyle(CustomButtonStyle(type: .primary, size: .medium))
                .padding(.bottom,16)
            }
                
            
            HStack(spacing: 4) {
                    Text("Don't have an account?")
                    .font(FontFamily.Poppins.regular.swiftUIFont(size: 15))
                    .foregroundColor(Asset.Colors.typography500.swiftUIColor)
                    
                    Button {
                        // Navigate to SignUp
                    } label: {
                        Text("Sign up")
                            .font(FontFamily.Poppins.semiBold.swiftUIFont(size: 15))
                            .foregroundColor(Asset.Colors.typography500.swiftUIColor)
                            .underline()
                    }
                }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        
    }
    
    private func validateFields() -> Bool {
        
        var isValid = true
        
        // Email validate
        if emailStr.trimmingCharacters(in: .whitespaces).isEmpty {
            emailState = .invalid
            emailError = "Email is required"
            isValid = false
            
        } else if !isValidEmail(emailStr) {
            emailState = .invalid
            emailError = "Invalid email format"
            isValid = false
            
        } else {
            emailState = .valid
            emailError = nil
        }
        
        // Password validate
        if password.isEmpty {
            passwordState = .invalid
            passwordError = "Password is required"
            isValid = false
            
        } else if password.count < 6 {
            passwordState = .invalid
            passwordError = "Password must be at least 6 characters"
            isValid = false
            
        } else {
            passwordState = .valid
            passwordError = nil
        }
        
        return isValid
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let regex =
        "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format:"SELF MATCHES %@", regex)
            .evaluate(with: email)
    }

    private func login() {
        
        guard validateFields() else { return }
        
        errorMessage = nil
        isLoading = true
        
        AuthService.shared.login(email: emailStr, password: password) { result in
            
            DispatchQueue.main.async {
                isLoading = false
                
                switch result {
                case .success:
                    print("Login Success")
                    
                case .failure(let error):
                    
                    // Firebase error
                    passwordState = .invalid
                    passwordError = error.localizedDescription
                }
            }
        }
    }


        
}

#Preview {
    LoginView()
}
