//
//  StadiumAnnotation.swift
//  FCRef
//
//  Created by Mathieu @theunknowman_80 on 27/05/2023.
//

import Foundation
import MapKit

// Information to display in the pop-up window when clicking on the corresponding point for a club on map.

class StadiumAnnotation: NSObject, MKAnnotation {
    var stadium: Stadium
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(_ stadium: Stadium) {
        self.stadium = stadium
        self.title = self.stadium.name
        self.coordinate = CLLocationCoordinate2D(latitude: self.stadium.lat, longitude: self.stadium.long)
        self.subtitle = "Capacity: \(self.stadium.capacity) places"
    }
}
