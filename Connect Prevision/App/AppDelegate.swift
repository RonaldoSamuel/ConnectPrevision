//
//  AppDelegate.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 25/02/21.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    var window: UIWindow?
    var coordinator: MainCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
        
        GIDSignIn.sharedInstance().clientID = "770182017392-ceifqf8010a4ar4k3r0fe2039b8k4qr3.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        
        
        let navController = UINavigationController()
        coordinator = MainCoordinator(navigationcontroller: navController)
        
        coordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navController
        
        return true
    }
    
    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    func loginButton(_ loginButton: FBLoginButton!, didCompleteWith result: LoginManagerLoginResult!, error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        print("=================================================================")
        print("==================Inciando Login Facebook========================")
        print("=================================================================")
        let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
        Auth.auth().signIn(with: credential, completion: {authResult, Error in if let Error = Error as NSError? {
            switch AuthErrorCode(rawValue: Error.code){
            case .operationNotAllowed:
                break
            case .emailAlreadyInUse:
                print("Email Ja Existe")
                break
            case .invalidEmail:
                print("Email Invalido")
                break
            case .weakPassword:
                
                print("Sua Senha é fraca")
                break
                
            default:
                print("Error: \(Error.localizedDescription)")
            }
            
            
        } else {
            print("Usuario Google Logado")
            self.coordinator?.home()
        }
        
        })
        
        print("=================================================================")
        print("=================================================================")
        print("=================================================================")
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            // [START_EXCLUDE silent]
            NotificationCenter.default.post(
                name: Notification.Name(rawValue: "ToggleAuthUINotification"), object: nil, userInfo: nil)
            // [END_EXCLUDE]
            return
        }
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        print(credential)
        
        Auth.auth().signIn(with: credential, completion: {authResult, Error in if let Error = Error as NSError? {
            switch AuthErrorCode(rawValue: Error.code){
            case .operationNotAllowed:
                break
            case .emailAlreadyInUse:
                print("Email Ja Existe")
                break
            case .invalidEmail:
                print("Email Invalido")
                break
            case .weakPassword:
                
                print("Sua Senha é fraca")
                break
                
            default:
                print("Error: \(Error.localizedDescription)")
            }
            
            
        } else {
            print("usuario criado")
            self.coordinator?.home()
            
        }
        
        })
        
        // [START_EXCLUDE]
        NotificationCenter.default.post(
            name: Notification.Name(rawValue: "ToggleAuthUINotification"),
            object: nil,
            userInfo: ["statusText": "Signed in user:"])
        // [END_EXCLUDE]
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // [START_EXCLUDE]
        NotificationCenter.default.post(
            name: Notification.Name(rawValue: "ToggleAuthUINotification"),
            object: nil,
            userInfo: ["statusText": "User has disconnected."])
        // [END_EXCLUDE]
    }
    
}

