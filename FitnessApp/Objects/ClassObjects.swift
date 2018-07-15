//
//  ClassObjects.swift
//  FitnessApp
//
//  Created by Jamal Rasool on 7/14/18.
//  Copyright © 2018 Jamal Rasool. All rights reserved.
//

import Foundation
import UIKit

class Trainers: NSObject {
    
    var first_name: String?
    var last_name: String?
    var phone: Int?
    var email: String?
    var location: Int?
//    var certifcations: Certifications[]?
}

class Users: NSObject {
    var first_name: String?
    var last_name: String?
    var phone: Int?
    var email: String?
    var location: Int?
    var user_age: Int?
    var user_weight: Int?
    var user_height: Int?
    
}

/**
 Certifications
 Comming soon to implementing
 */

class Certifications: NSObject {
    var type_of_cert: String?
}

class workoutClasses: NSArray {
    var work_out_type: [String] = ["Yoga","Running","Lifiting"]
}

// Post Class

class postClasses: NSObject {
    var name: String?
    var description_of_trainer: String?
    var start_date: Date?
    var end_date: Date?
    var trainer: String?
    var users: Users?
    var workouts: workoutClasses?
}



