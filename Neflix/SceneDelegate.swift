//
//  SceneDelegate.swift
//  Neflix
//
//  Created by 김하람 on 2023/08/01.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    // 앱이 실행되거나 새로운 화면(Scene)이 추가될 때 실행되는 로직으로, 앱의 초기 화면을 설정하는 역할
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // windowScene이라는 변수를 UIWindowScene 타입으로 정의
        // UIWindowScene 타입으로 캐스팅이 성공하지 않으면 이후의 코드를 실행하지 않고 종료
        guard let windowScene = (scene as? UIWindowScene) else { return }
        // UIWindow 객체를 생성하고, 해당 UIWindow의 frame을 windowScene.coordinateSpace.bounds로 설정
        // 새로운 Scene을 위한 윈도우를 해당 Scene의 좌표 공간에 맞게 생성하는 역할
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        // 해당 UIWindow를 특정 Scene에 연결
        window?.windowScene = windowScene
        // 앱의 초기 화면을 ViewController로 지정
        window?.rootViewController = MainTabBarViewController()
        // UIWindow를 키 윈도우로 설정하고, 화면에 보이도록 설정
        // 이 코드를 통해 앱이 실행되면 초기 화면이 보이게 된다
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

