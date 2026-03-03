import Foundation
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import FBSDKLoginKit

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
    
    
    func loginWithGoogle(completion: @escaping (Result<User, Error>) -> Void) {
        guard
            let clientID = FirebaseApp.app()?.options.clientID,
            let rootVC = UIApplication.shared.rootViewController
        else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(
            withPresenting: rootVC
        ) { result, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard
                let user = result?.user,
                let idToken = user.idToken?.tokenString
            else { return }
            
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: user.accessToken.tokenString
            )
            
            Auth.auth().signIn(with: credential) { result, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let firebaseUser = result?.user else { return }
                completion(.success(firebaseUser))
            }
        }
    }
    
    // MARK: - Facebook
    func loginWithFacebook(completion: @escaping (Result<User, Error>) -> Void) {
        
        let loginManager = LoginManager()
        
        loginManager.logIn(permissions: ["public_profile", "email"],
                           from: UIApplication.shared.rootViewController) { result, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let result = result, !result.isCancelled else {
                return
            }
            
            guard let accessToken = AccessToken.current?.tokenString else {
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let user = authResult?.user else { return }
                completion(.success(user))
            }
        }
    }
   
    //MARK: - Reset Password
    func resetPassword(email: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    // MARK: - Sign Out
    func signOut() throws {
        try Auth.auth().signOut()
        GIDSignIn.sharedInstance.signOut()
        LoginManager().logOut()
    }
}
