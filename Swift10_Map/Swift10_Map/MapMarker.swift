//
//  MapMarker.swift
//  Swift10_Map
//
//  Created by 6272 on 22/11/2561 BE.
//  Copyright © 2561 6272. All rights reserved.
//

import UIKit
import MapKit

class MapMarker: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        super.init()
    }
    
}
