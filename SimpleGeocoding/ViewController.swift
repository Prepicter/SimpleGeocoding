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
        
        
        let addr = "부산광역시 양정동 429-19"
        // 지오코딩 객체 생성
        let geocoder = CLGeocoder()
        
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

