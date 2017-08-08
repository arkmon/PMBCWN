//  MixPanelConfiguration.swift
//  CreditMatcher
//
//  Copyright © 2017 Experian. All rights reserved.
//

import Foundation
import Mixpanel
import UserNotifications

class MixPanelConfiguration: NSObject, UNUserNotificationCenterDelegate {
    
    class func setupMixPanel() {
        
        Mixpanel.initialize(token: "13ac74968833c76952a678e053226d4e")
        let mixpanel = Mixpanel.mainInstance()
        
        mixpanel.createAlias("iPhone",
                             distinctId: mixpanel.distinctId);
        // To create a user profile, you must call identify
        mixpanel.identify(distinctId: mixpanel.distinctId)
        Mixpanel.mainInstance().track(event: "Plan Selected",
                                      properties: ["Plan" : "Premium"])
    }
    
    class func didRegisterNotifications(_ deviceToken: Data) {
        let mixpanel = Mixpanel.mainInstance()
        mixpanel.people .addPushDeviceToken(deviceToken)
    }
    
    class func registerPushNotifications() {
        // iOS 10 support
        if #available(iOS 10, *) {
            UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]){ (granted, error) in }
            UIApplication.shared.registerForRemoteNotifications()
        } else {
            // iOS 7 support
            UIApplication.shared.registerForRemoteNotifications(matching: [.badge, .sound, .alert])
        }
    }
    
    class func removeAllPushDeviceTokens(_ deviceToken: Data) {
        Mixpanel.mainInstance().people.removePushDeviceToken(deviceToken)
    }
}


