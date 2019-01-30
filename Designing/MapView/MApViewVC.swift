//
//  MApViewVC.swift
//  Designing
//
//  Created by Jenish on 22/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit
import MapKit

class MApViewVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var MapView: MKMapView!
    
    @IBOutlet weak var MapviewSearch: UITextField!
  
    var annotation:MKAnnotation!
    var localSearchRequest:MKLocalSearch.Request!
    var localSearch:MKLocalSearch!
    var localSearchResponse:MKLocalSearch.Response!
    var error:NSError!
    var pointAnnotation:MKPointAnnotation!
    var pinAnnotationView:MKPinAnnotationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        // Do any additional setup after loading the view.
    }
   
    @IBAction func textFieldPrimaryaction(_ sender: Any) {
        if self.MapView.annotations.count != 0{
            annotation = self.MapView.annotations[0]
            self.MapView.removeAnnotation(annotation)
        }
        //2
        localSearchRequest = MKLocalSearch.Request()
        localSearchRequest.naturalLanguageQuery = MapviewSearch.text
        localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start { (localSearchResponse, error) -> Void in
            
            if localSearchResponse == nil{
                let alertController = UIAlertController(title: nil, message: "Place Not Found", preferredStyle: UIAlertController.Style.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            }
            //3
            self.pointAnnotation = MKPointAnnotation()
            self.pointAnnotation.title = self.MapviewSearch.text
            self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude:     localSearchResponse!.boundingRegion.center.longitude)
           let cordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude:     localSearchResponse!.boundingRegion.center.longitude)
           
            
            
            self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
            self.MapView.centerCoordinate = self.pointAnnotation.coordinate
            self.MapView.addAnnotation(self.pinAnnotationView.annotation!)
            
           // let span = MKCoordinateSpan(latitudinalMeters: 1000, longitudinalMeters: 1000)
            let regionRadius: CLLocationDistance = 1000
            let region = MKCoordinateRegion(center: cordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            self.MapView.setRegion(region, animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
