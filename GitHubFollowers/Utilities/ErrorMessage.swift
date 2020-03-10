//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by Kelvin Reid on 3/7/20.
//  Copyright © 2020 Kelvin Reid. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    // raw values are the associate type of string
    case invalidUsername = "This username created an invalid request. Please try again 😐."
    case unableToComplete = "Unable to complete your request. Please check your internet connection 😵."
    case invalidResponse = "Invalid response from the server. Please try again 😳."
    case invalidData = "The data received from the server was invalid. Please try again 🤨."
}
