//
//  AppDelegate.swift
//  Apple Pie
//
//  Created by Firuza on 15.03.2024.
//
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Запуск окна приложения
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Настройка главного контроллера
        let rootViewController = UIViewController()
        rootViewController.view.backgroundColor = .white
        
        // Отображение окна
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Конфигурация новой сессии сцены
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Освобождение ресурсов для отброшенных сессий
    }

}
