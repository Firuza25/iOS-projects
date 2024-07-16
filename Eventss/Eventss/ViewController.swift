//
//  ViewController.swift
//  Eventss
//
//  Created by Firuza on 07.05.2024.
//

import UIKit
import SwiftUI
//import FirebaseCore
//
//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        FirebaseApp.configure()
//        return true
//    }
//
//}


class ViewController: UIViewController {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создаем экземпляр Splash SwiftUI View
        let splashView = Splash()
        
        // Создаем UIHostingController с нашим SwiftUI View
        let hostingController = UIHostingController(rootView: splashView)
        
        // Добавляем UIHostingController как дочерний контроллер
        addChild(hostingController)
        
        // Устанавливаем фрейм для UIHostingController
        hostingController.view.frame = view.bounds
        
        // Добавляем представление UIHostingController в иерархию представлений
        view.addSubview(hostingController.view)
        
        // Оповещаем UIHostingController о переходе к родителю
        hostingController.didMove(toParent: self)
    }
}





