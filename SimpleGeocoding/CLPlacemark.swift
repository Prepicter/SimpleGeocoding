//
//  CLPlacemark.swift
//  SimpleGeocoding
//
//  Created by D7702_09 on 2019. 10. 15..
//  Copyright © 2019년 csd5766. All rights reserved.
//

import CoreLocation

extension CLPlacemark {
    var compactAddress: String? {
        if let name = name {
            var result = name
            
            if let street = thoroughfare {
                result += ", \(street)"
            }
            
            if let city = locality {
                result += ", \(city)"
            }
            
            if let country = country {
                result += ", \(country)"
            }
            
            return result
    }
    return nil
}
}
