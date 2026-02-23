import Foundation
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import FacebookLogin

final class AuthService {

    static let shared = AuthService()
    private init() {}

    // MARK: - Email/Password
    func login(email: String,
               password: String,
               completion: @escaping (Result<User, Error>) -> Void) {

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let user = result?.user else { return }
            completion(.success(user))
        }
    }

    func register(email: String,
                  password: String,
                  completion: @escaping (Result<User, Error>) -> Void) {

        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let user = result?.user else { return }
            completion(.success(user))
        }
    }

    // MARK: - Google (v7+)
    func loginWithGoogle(
        presenting viewController: UIViewController) -> Void
    ) {

        GIDSignIn.sharedInstance().signIn()
    }


    // MARK: - Facebook
    func loginWithFacebook(
        presenting viewController: UIViewController,
        completion: @escaping (Result<User, Error>) -> Void
    ) {

        let loginManager = LoginManager()

        loginManager.logIn(
            permissions: ["email", "public_profile"],
            from: viewController
        ) { result, error in

            if let error = error {
                completion(.failure(error))
                return
            }

            guard
                let result = result,
                !result.isCancelled,
                let tokenString = AccessToken.current?.tokenString
            else { return }

            let credential = FacebookAuthProvider.credential(
                withAccessToken: tokenString
            )

            Auth.auth().signIn(with: credential) { result, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let user = result?.user else { return }
                completion(.success(user))
            }
        }
    }

    // MARK: - Sign Out
    func signOut() throws {
        try Auth.auth().signOut()
        GIDSignIn.sharedInstance().signOut()
    }
}
