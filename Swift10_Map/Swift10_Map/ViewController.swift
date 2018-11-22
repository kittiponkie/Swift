//
//  ViewController.swift
//  Swift10_Map
//
//  Created by 6272 on 22/11/2561 BE.
//  Copyright © 2561 6272. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    func setCenterOfMapToLocation(location: CLLocationCoordinate2D) {
        let coordinate = CLLocationCoordinate2DMake(location.latitude, location.longitude)
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
    }
    
    func addPinToMapView(){
        let location = CLLocationCoordinate2DMake(13.765148, 100.538322)
        let annotation = MapMarker(coordinate: location, title: "Victory Monument", subtitle: "Phaya Thai Road")
        mapView.addAnnotation(annotation)
        setCenterOfMapToLocation(location: location)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.delegate = self as? MKMapViewDelegate
        addPinToMapView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

