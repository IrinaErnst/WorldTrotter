//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Irina Kalashnikova on 8/2/16.
//  Copyright © 2016 Irina Kalashnikova. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var mapView: MKMapView!
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        
        let standartString = NSLocalizedString("Standart", comment: "Standart map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let segmentedControl = UISegmentedControl(items: [standartString, hybridString, satelliteString])
        
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), forControlEvents: .ValueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 4)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        
        
        let zoomInButton = UIButton(frame: CGRect(x: 18, y: 70, width: 70, height: 30))
        zoomInButton.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
        zoomInButton.setTitle("Zoom In", forState: .Normal)
        zoomInButton.layer.cornerRadius = 5
        zoomInButton.addTarget(self, action: #selector(zoomIn), forControlEvents: .TouchUpInside)
        view.addSubview(zoomInButton)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        //mapView.setUserTrackingMode(MKUserTrackingMode.Follow, animated: true)
    
    }
    
    func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }
    
    @IBAction func zoomIn(sender: UIButton!){
        print("Button tapped")
        let userLocation = mapView.userLocation
        let region = MKCoordinateRegionMakeWithDistance((userLocation.location?.coordinate)!, 2000, 2000)
        mapView.setRegion(region, animated: true)
    }
    
    
    func mapView(mapView: MKMapView, didUpdateUserLocation
        userLocation: MKUserLocation) {
        mapView.centerCoordinate = userLocation.location!.coordinate
    }
    
}
