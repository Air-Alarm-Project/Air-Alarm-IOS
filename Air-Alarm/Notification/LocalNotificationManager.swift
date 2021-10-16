//
//  LocalNotificationManager.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/10/04.
//

import Foundation
import UserNotifications

struct Notification {
    var id: String
    var title: String
}

class LocalNotificationManager {
    var notifications = [Notification]()
    
    // 알림 관련 활동을 관리
    // 알림을 사용하려면 사용자에게 requestAuthorization 메서드로 권한을 요청해야 함.
    func requestPermission() -> Void {
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.alert, .badge, .alert]) { granted, error in
                if granted == true && error == nil {
                }
        }
    }
    
    func addNotification(title: String) -> Void {
        notifications.append(Notification(id: UUID().uuidString, title: title))
    }
    
//    func schedule() -> Void {
//          UNUserNotificationCenter.current().getNotificationSettings { settings in
//              switch settings.authorizationStatus {
//              case .notDetermined:
//                  self.requestPermission()
//              case .authorized, .provisional:
//                  self.scheduleNotifications()
//              default:
//                  break
//
//            }
//        }
//    }
    
    func scheduleNotifications() -> Void {        // 알림 설정
        for notification in notifications {
            let content = UNMutableNotificationContent()
            content.title = notification.title
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false) // 알림이 오는 시간 설정
            
            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else { return }
                print("Scheduling notification with id: \(notification.id)")
            }
        }
    }
}
