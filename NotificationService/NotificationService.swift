//
//  NotificationService.swift
//  NotificationService
//
//  Created by Rashmi Yadav on 25/11/22.
//

import UserNotifications
import CTNotificationService
import CleverTapSDK

class NotificationService: CTNotificationServiceExtension {
    
    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?
    
    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        CleverTap.setDebugLevel(CleverTapLogLevel.debug.rawValue)

        let userDefaults = UserDefaults(suiteName: "group.sampleios")
        let testUserId = userDefaults?.object(forKey: "identity")
    
        if(testUserId != nil){
            CleverTap.sharedInstance()?.onUserLogin(testUserId as! [AnyHashable : Any])
                }
        
        CleverTap.sharedInstance()?.recordNotificationViewedEvent(withData: request.content.userInfo)
        super.didReceive(request, withContentHandler: contentHandler)
    }
}
