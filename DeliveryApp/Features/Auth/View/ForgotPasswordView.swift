//
//  ForgotPasswordView.swift
//  DeliveryApp
//
//  Created by Trọng Nghĩa Nguyễn on 3/3/26.
//

import SwiftUI

struct ForgotPasswordView: View {
    @StateObject var coordinator: LoginCoordinator
    @Environment(\.colorScheme) var colorScheme
    @State var emailStr = ""
    @State var isAcceptforLogin = false
    @State private var errorMessage: String?
    @State private var isLoading = false
    
    @State private var emailState: FieldState = .normal
    @State private var emailError: String?

    
    // Alert
    @State private var showAlert = false
    @State private var alertType: AlertType = .success
    @State private var alertMessage = ""
    var body: some View {
            VStack {
                HStack {
                    BackButton {
                        coordinator.pop()
                    }
                    
                    Spacer()
                }
                .overlay {
                    Asset.Assets.typeSizeSmall.swiftUIImage
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 70, height: 24)
                        .foregroundStyle(colorScheme == .dark ? Asset.Colors.white.swiftUIColor : Asset.Colors.black.swiftUIColor)
                }
                
                
                Text("Forgot your\npassword")
                    .font(FontFamily.Poppins.bold.swiftUIFont(size: 32))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(Color.Typography.heading.swiftUIColor)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.bottom, 8)
                
                Text("Enter your email address and we'll send you a link to reset your password.")
                    .font(FontFamily.Poppins.medium.swiftUIFont(size: 15))
                    .foregroundStyle(Asset.Colors.typography400.swiftUIColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 8)
                
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
         
                
                Spacer()
                
                Button("Continue") {
                    sendForgotToEmail()
                }
                .buttonStyle(CustomButtonStyle(type: isAcceptforLogin ? .primary : .disabled, size: .medium))
                .disabled(!isAcceptforLogin)
                .padding(.bottom, 16)
                
 
                
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        .onChange(of: emailStr){_ in updateAcceptState()}
        .topAlert(showAlert: $showAlert, type: $alertType, message: $alertMessage)
    }
    
    private func updateAcceptState() {
        isAcceptforLogin = !emailStr.trimmingCharacters(in: .whitespaces).isEmpty
            && emailState == .valid
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
    
    private func isValidEmail(_ email: String) -> Bool {
        let regex =
        "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format:"SELF MATCHES %@", regex)
            .evaluate(with: email)
    }
    
    private func sendForgotToEmail() {
        errorMessage = nil
        isLoading = true
        
        AuthService.shared.resetPassword(email: emailStr) { result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success:
                    showTopAlert(type: .success, message: "Reset link sent! Please check your email.")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        coordinator.pop()
                    }
                case .failure(let error):
                    showTopAlert(type: .error, message: error.localizedDescription)
                }
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

