//
//  TimeHandlers.swift
//  FitnessApp
//
//  Created by Jamal Rasool on 7/14/18.
//  Copyright © 2018 Jamal Rasool. All rights reserved.
//

import Foundation

func timeAgoSinceDate(_ date:Date, numericDates:Bool) -> String {
    let calendar = Calendar.current
    let now = Date()
    let earliest = (now as NSDate).earlierDate(date)
    let latest = (earliest == now) ? date : now
    let components:DateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.minute , NSCalendar.Unit.hour , NSCalendar.Unit.day , NSCalendar.Unit.weekOfYear , NSCalendar.Unit.month , NSCalendar.Unit.year , NSCalendar.Unit.second], from: earliest, to: latest, options: NSCalendar.Options())
    
    if (components.year! >= 2) {
        return String.localizedStringWithFormat(NSLocalizedString("%d years ago", comment: ""), components.year!)
    } else if (components.year! >= 1){
        if (numericDates){
            return NSLocalizedString("1 year ago", comment: "")
        } else {
            return NSLocalizedString("Last year", comment: "")
        }
    } else if (components.month! >= 2) {
        return String.localizedStringWithFormat(NSLocalizedString("%d months ago", comment: ""), components.month!)
    } else if (components.month! >= 1){
        if (numericDates){
            return NSLocalizedString("1 month ago", comment: "")
        } else {
            return NSLocalizedString("Last month", comment: "")
        }
    } else if (components.weekOfYear! >= 2) {
        return String.localizedStringWithFormat(NSLocalizedString("%d weeks ago", comment: ""), components.weekOfYear!)
    } else if (components.weekOfYear! >= 1){
        if (numericDates){
            return NSLocalizedString("1 week ago", comment: "")
        } else {
            return NSLocalizedString("Last week", comment: "")
        }
    } else if (components.day! >= 2) {
        return String.localizedStringWithFormat(NSLocalizedString("%d days ago", comment: ""), components.day!)
    } else if (components.day! >= 1){
        if (numericDates){
            return NSLocalizedString("1 day ago", comment: "")
        } else {
            return NSLocalizedString("Yesterday", comment: "")
        }
    } else if (components.hour! >= 2) {
        return String.localizedStringWithFormat(NSLocalizedString("%d hours ago", comment: ""), components.hour!)
    } else if (components.hour! >= 1){
        if (numericDates){
            return NSLocalizedString("1 hours ago", comment: "")
        } else {
            return NSLocalizedString("An hour ago", comment: "")
        }
    } else if (components.minute! >= 2) {
        return String.localizedStringWithFormat(NSLocalizedString("%d minutes ago", comment: ""), components.minute!)
    } else if (components.minute! >= 1){
        if (numericDates){
            return NSLocalizedString("1 minute ago", comment: "")
        } else {
            return NSLocalizedString("A minute ago", comment: "")
        }
    } else if (components.second! >= 3) {
        return String.localizedStringWithFormat(NSLocalizedString("%d seconds ago", comment: ""), components.second!)
    } else {
        return NSLocalizedString("Just now", comment: "")
    }
}
