//  Converted with Swiftify v1.0.6395 - https://objectivec2swift.com/
//
//  MixPanelConfiguration.swift
//  CreditMatcher
//
//  Created by Tomas Urbonas on 08/02/2017.
//  Copyright © 2017 Experian. All rights reserved.
//

import Foundation
import Mixpanel
import UserNotifications

private let kVerticalKey_creditCard: String = "Credit Cards"
private let kVerticalKey_loan: String = "Loans"
private let kPropertyKey_customerId: String = "prop_customer_number"
private let kPropertyKey_vertical: String = "prop_vertical"
private let kPropertyKey_contenfulId: String = "prop_contentful_id"
private let kPropertyKey_duration: String = "prop_duration"
private let kPropertyKey_date: String = "prop_date"
private let kPropertyKey_loanType: String = "prop_loan_type"
private let kPropertyKey_purpose: String = "prop_purpose"
private let kPropertyKey_employmentStatus: String = "prop_employment_status"
private let kPropertyKey_residentialStatus: String = "prop_residential_status"
private let kPropertyKey_personalIncome: String = "prop_personal_income"
private let kPropertyKey_totalSearchesCount: String = "prop_total_searches_count"
private let kPropertyKey_lender: String = "prop_lender"
private let kActionKey_clickedLead: String = "action_clicked_lead"

class MixPanelConfiguration: NSObject {
    // setup
    
    // MARK: - setup
    
    class func setupMixPanel() {
        Mixpanel.initialize(token: "MIXPANEL_TOKEN")
        let mixpanel = Mixpanel.mainInstance()
        // This makes the current ID (by default an auto-generated GUID)
        // and '13793' interchangeable distinct ids (but not retroactively).
        mixpanel.createAlias("iPhone",
                             distinctId: mixpanel.distinctId);
        // To create a user profile, you must call identify
        mixpanel.identify(distinctId: mixpanel.distinctId)
    }
    
    // push notifications
    // to register push notifications MUST to set arePushNotificationsEnabled to YES on OwnerConfiguration
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
}

func addPushDeviceToken(_ deviceToken: Data) {
    Mixpanel.mainInstance().people.addPushDeviceToken(deviceToken)
}

func removeAllPushDeviceTokens(_ deviceToken: Data) {
    Mixpanel.mainInstance().people.removePushDeviceToken(deviceToken)
}

//func deepLinkString(from url: URL) -> String {
//    var deepLinkString: String = ""
//    if url == nil {
//        print("WARNING: url is nil")
//        return deepLinkString
//    }
////    let absoluteString: String = url.absoluteString
////    if absoluteString.contains(_) {
////        deepLinkString = absoluteString
////    }
////    return deepLinkString
//}}
