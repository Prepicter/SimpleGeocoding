//
//  ViewController.swift
//  SimpleGeocoding
//
//  Created by D7702_09 on 2019. 10. 15..
//  Copyright © 2019년 csd5766. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var pins = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let loc = CLLocation(latitude: 35.165806, longitude: 129.072548)
        
        let addr = "부산광역시 양정동 429-19"
        // 지오코딩 객체 생성
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(loc) {
            placemarks, error in
            // 함수 바디 정의
            if error != nil {
                print("reverseGeocoding failed \(String(describing: error))")
            }
            // optional binding nil check
            if let myPlacemarks = placemarks {
                let myPlacemark = myPlacemarks.first
                print(myPlacemark?.location?.coordinate as Any)
                print(myPlacemark?.compactAddress)
                let pin = MKPointAnnotation()
                pin.coordinate = loc.coordinate
                pin.title = myPlacemark?.name
                pin.subtitle = myPlacemark?.postalCode
                print("title : \(myPlacemark?.name) - postal : \(myPlacemark?.postalCode)")
                self.pins.append(pin)
                self.mapView.showAnnotations(self.pins, animated: true)
                
            } else {
                print("nil 발생")
            }
        }
        
//        geocoder.geocodeAddressString(addr, completionHandler: {
//            (placemarks: [CLPlacemark]?, error: Error?) in
//            // 함수 바디 정의
//            if error != nil {
//                print("geocoding failed \(error)")
//            }
//            // optional binding nil check
//            if let myPlacemarks = placemarks {
//               let myPlacemark = myPlacemarks.first
//                print(myPlacemark?.location?.coordinate)
//
//                let pin = MKPointAnnotation()
//                pin.coordinate = (myPlacemark?.location?.coordinate)!
//                pin.title = "동의과학대학교"
//                pin.subtitle = "대학교"
//                self.pins.append(pin)
//                self.mapView.showAnnotations(self.pins, animated: true)
//
//            } else {
//                print("nil 발생")
//            }
//            }
//
//        )
        // 후행 클로저
        geocoder.geocodeAddressString(addr) {
            placemarks, error in
            // 함수 바디 정의
            if error != nil {
                print("geocoding failed \(error)")
            }
            // optional binding nil check
            if let myPlacemarks = placemarks {
                let myPlacemark = myPlacemarks.first
                print(myPlacemark?.location?.coordinate)
                print(myPlacemark?.compactAddress)
                let pin = MKPointAnnotation()
                pin.coordinate = (myPlacemark?.location?.coordinate)!
                pin.title = "동의과학대학교"
                pin.subtitle = "대학교"
                self.pins.append(pin)
                self.mapView.showAnnotations(self.pins, animated: true)
                
            } else {
                print("nil 발생")
            }
        }
        
    }
}
