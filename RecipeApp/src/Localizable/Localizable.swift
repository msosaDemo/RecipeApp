//
//  Localizable.swift
//  MWeather
//
//  Created by Mauricio Pimienta on 9/21/24.
//

import Foundation

enum LocalizationSystem: String {
    case rTitle = "r_title"
    case rNavSubtitle = "r_nav_subtitle"
    case rNetworkError = "r_network_error"
    case rNetworkErrorUrl = "r_network_error_url"
    case rNetworkErrorResponse = "r_network_error_response"
    case rNetworkErrorParsing = "r_network_error_parsing"
    case rNetworkErrorUnexpected = "r_network_error_unexpected"
    
    var localized: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
    
}
