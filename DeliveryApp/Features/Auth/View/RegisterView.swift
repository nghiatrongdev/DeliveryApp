//
//  RegisterView.swift
//  DeliveryApp
//
//  Created by Trọng Nghĩa Nguyễn on 25/2/26.
//

import SwiftUI

struct RegisterView: View {
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
    @State private var isAgreeTerms = false
    
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
                
                Text("Create a new\naccount")
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
                
                HStack(spacing: 15) {
                    Button {
                        isAgreeTerms.toggle()
                    } label: {
                        !isAgreeTerms ? Asset.Assets.checkboxdefaultfalse.swiftUIImage : Asset.Assets.checkboxdefaulttrue.swiftUIImage
                    }
                    Text("I agree to terms & conditions")
                        .font(FontFamily.Poppins.regular.swiftUIFont(size: 15))
                        .foregroundStyle(Asset.Colors.typography400.swiftUIColor)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .onChange(of: isAgreeTerms){_ in updateAcceptState()}
                
                
                Spacer()
                
                Button("Create account") {
                    createAccount()
                }
                .buttonStyle(CustomButtonStyle(type: isAcceptforLogin ? .primary : .disabled, size: .medium))
                .disabled(!isAcceptforLogin)
                .padding(.bottom, 16)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .onChange(of: emailStr){_ in updateAcceptState()}
            .onChange(of: passwordStr){_ in updateAcceptState()}
            .topAlert(showAlert: $showAlert, type: $alertType, message: $alertMessage)
           
    }
    
    private func createAccount() {
          AuthService.shared.register(email: emailStr, password: passwordStr) { result in
              switch result {
              case .success:
                  showTopAlert(type: .success, message: "Account created successfully!")
                  DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                      coordinator.pop()
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
    private func updateAcceptState() {
        isAcceptforLogin = !emailStr.trimmingCharacters(in: .whitespaces).isEmpty
        && !passwordStr.isEmpty && isAgreeTerms
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
    
    
}
