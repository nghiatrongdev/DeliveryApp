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
    @State var passwordStr = ""
    @State var isAcceptforLogin = false
    @State private var errorMessage: String?
    @State private var isLoading = false
    
    @State private var emailState: FieldState = .normal
    @State private var passwordState: FieldState = .normal
    @State private var emailError: String?
    @State private var passwordError: String?
    
    // Alert
    @State private var showAlert = false
    @State private var alertType: AlertType = .success
    @State private var alertMessage = ""
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
                .onChange(of: emailStr) { _ in
                    validateEmail()
                }
                
                SecureTextFieldCommon(
                    placeholder: "password",
                    text: $passwordStr,
                    state: passwordState,
                    errorMessage: passwordError
                )
                .padding(.bottom, 8)
                .onChange(of: passwordStr) { _ in
                    validatePassword()
                }
                
                Button {
                    coordinator.push(.forgot)
                } label: {
                    Text("forgot password")
                        .font(FontFamily.Poppins.bold.swiftUIFont(size: 15))
                        .foregroundStyle(Asset.Colors.primary700.swiftUIColor)
                        .frame(height: 26)
                }
                
                
                Spacer()
                
                Button("Login") {
                    login()
                }
                .buttonStyle(CustomButtonStyle(type: isAcceptforLogin ? .primary : .disabled, size: .medium))
                .disabled(!isAcceptforLogin)
                .padding(.bottom, 16)
                
                
                HStack(spacing: 4) {
                    Text("Don't have an account?")
                        .font(FontFamily.Poppins.regular.swiftUIFont(size: 15))
                        .foregroundColor(Asset.Colors.typography500.swiftUIColor)
                    
                    Button {
                        coordinator.push(.register)
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
        .onChange(of: emailStr){_ in updateAcceptState()}
        .onChange(of: passwordStr){_ in updateAcceptState()}
        .topAlert(showAlert: $showAlert, type: $alertType, message: $alertMessage)
        .loading(isLoading)
    }
    
    private func updateAcceptState() {
        isAcceptforLogin = !emailStr.trimmingCharacters(in: .whitespaces).isEmpty 
        && !passwordStr.isEmpty
    }
    private func validateEmail() {
        if emailStr.trimmingCharacters(in: .whitespaces).isEmpty {
            emailState = .normal
            emailError = nil
        } else if !isValidEmail(emailStr) {
            emailState = .invalid
            emailError = "Invalid email format"
        } else {
            emailState = .valid
            emailError = nil
        }
        updateAcceptState()
    }
    
    private func validatePassword() {
        if passwordStr.isEmpty {
            passwordState = .normal
            passwordError = nil
        } else if passwordStr.count < 6 {
            passwordState = .invalid
            passwordError = "Password must be at least 6 characters"
        } else {
            passwordState = .valid
            passwordError = nil
        }
        updateAcceptState()
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let regex =
        "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format:"SELF MATCHES %@", regex)
            .evaluate(with: email)
    }
    
    private func login() {
        errorMessage = nil
        isLoading = true
        
        AuthService.shared.login(email: emailStr, password: passwordStr) { result in
            switch result {
            case .success:
                showTopAlert(type: .success, message: "Login Success")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    coordinator.completeLogin()
                }
            case .failure(let error):
                showTopAlert(type: .error, message: error.localizedDescription)
            }
        }
    }
    
    private func showTopAlert(type: AlertType, message: String) {
           alertType = type
           alertMessage = message
           withAnimation {
               showAlert = true
           }
           DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
               withAnimation {
                   showAlert = false
               }
           }
       }
    
    
    
}
