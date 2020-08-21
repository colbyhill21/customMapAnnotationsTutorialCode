//
//  ViewController.swift
//  customMapAnnotations
//
//  Created by Colby Hill on 8/20/20.
//  Copyright © 2020 randomorg. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        self.configureMap()
        self.placePins()
    }

    func configureMap() {
        let center = CLLocationCoordinate2D(latitude: 40.730824, longitude: -73.997330)
        let span = MKCoordinateSpan(latitudeDelta: 0.125, longitudeDelta: 0.125)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func placePins() {
        let coords = [CLLocationCoordinate2D(latitude: 40.689249, longitude: -74.044500), CLLocationCoordinate2D(latitude: 40.781174, longitude: -73.966660), CLLocationCoordinate2D(latitude: 40.748817, longitude: -73.985428), CLLocationCoordinate2D(latitude: 40.706175, longitude: -73.996918)]
        let titles = ["Statue Of Liberty", "Central Park", "Empire State Building", "Brooklyn Bridge"]

        for i in coords.indices {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coords[i]
            annotation.title = titles[i]
            mapView.addAnnotation(annotation)
        }
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
        //                annotationView.glyphTintColor = UIColor.black
switch annotation.title!! {
    case "Statue Of Liberty":
        annotationView.markerTintColor = UIColor(red: (69.0/255), green: (95.0/255), blue: (170.0/255), alpha: 1.0)
        annotationView.glyphImage = UIImage(named: "liberty")
    case "Central Park":
        annotationView.markerTintColor = UIColor(red: (52.0/255), green: (114.0/255), blue: (1.0/255), alpha: 1.0)
        annotationView.glyphImage = UIImage(named: "park")
        annotationView.selectedGlyphImage = UIImage(named: "empire")
    case "Empire State Building":
        annotationView.markerTintColor = UIColor(red: (246.0/255), green: (233.0/255), blue: (212.0/255), alpha: 1.0)
        annotationView.glyphImage = UIImage(named: "empire")
    case "Brooklyn Bridge":
        annotationView.markerTintColor = UIColor(red: (146.0/255), green: (187.0/255), blue: (217.0/255), alpha: 1.0)
        annotationView.glyphImage = UIImage(named: "brooklyn")
    default:
        annotationView.markerTintColor = UIColor.blue
}
        return annotationView
    }
}

