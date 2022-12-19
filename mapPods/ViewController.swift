//
//  ViewController.swift
//  mapPods
//
//  Created by Mac on 14/11/22.
//

import UIKit
import GoogleMaps
import SDWebImage
class ViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    var marker = GMSMarker()
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        initializeMapSettings()
        addCameraSettingsOnMap()
        addMarkerOnMap(position: CLLocationCoordinate2D(latitude: 18.3663, longitude: 73.7559))
        mapView.mapType = .normal
        drawCircle()
        drawPolygon()
        drawPolyLine()
        
        let imgurl = NSURL(string: "https://via.placeholder.com/600/d32776")
        imageView.sd_setImage(with: imgurl as URL?)
        
    }
    
//MARK - init maps settings
    func initializeMapSettings()
    {
        mapView.settings.zoomGestures = true
        mapView.settings.tiltGestures = true
        mapView.settings.scrollGestures = true
        mapView.settings.myLocationButton = true
        mapView.settings.rotateGestures = true
    }
    
 //MARK - camera settings on map
    func addCameraSettingsOnMap(){
    let camera = GMSCameraPosition(latitude: 18.3663, longitude: 73.7559, zoom: 8.0)
        mapView.camera = camera
    }
    
    func addMarkerOnMap(position : CLLocationCoordinate2D){
        marker.position = position
        marker.title = "sinhgad Fort"
        marker.snippet = "This is sinhgad fort"
        marker.map = mapView
        marker.isDraggable = true
       // marker.icon = UIImage(named: "download")
   }
}
//MARK - conform to GMSMapViewDelegate
extension ViewController: GMSMapViewDelegate{
   
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("did begin Dragging called\(marker.position)")
    }
    
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("did drag called\(marker.position)")
    }
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("did end dragging called\(marker.position)")
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        /*marker.position = coordinate
        print("\(coordinate)")*/
        print("did tap at method called\(marker.position)")
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        view.backgroundColor = .magenta
        view.alpha = 0.7
        view.layer.cornerRadius = 4
        
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: view.frame.width - 15, height: 30))
        label.text = "Sinhgad"
        label.textColor = .black
        label.alpha = 0.8
        label.backgroundColor = .cyan
        label.textAlignment = .center
        view.addSubview(label)
        
        let label2 = UILabel(frame: CGRect(x: 10, y: 60, width: view.frame.width - 15, height: 30))
        label2.text = "Fort"
        label2.textColor = .black
        label2.alpha = 0.7
        label2.backgroundColor = .cyan
        label2.textAlignment = .center
        view.addSubview(label2)
        return view
    }
    
//MARK - func to draw circle
    func drawCircle(){
       let circle = CLLocationCoordinate2D(latitude: 18.3663, longitude: 73.7559)
        let cir = GMSCircle(position: circle, radius: 1000)
        cir.fillColor = UIColor.brown
        cir.strokeColor = .cyan
        cir.strokeWidth = 5
        cir.title = "Circle"
        cir.map = mapView
    }
    
    func drawPolygon(){
        
        let pathForPolygon = GMSMutablePath()
        pathForPolygon.add(CLLocationCoordinate2D(latitude: 18.52, longitude: 73.85))
        pathForPolygon.add(CLLocationCoordinate2D(latitude:19.90, longitude: 75.35))
        pathForPolygon.add(CLLocationCoordinate2D(latitude:19.16, longitude: 77.31))
        pathForPolygon.add(CLLocationCoordinate2D(latitude: 17.65, longitude: 75.90))
        
        let polygon = GMSPolygon(path: pathForPolygon)
        polygon.fillColor = UIColor(red: 0.23, green: 1.2, blue: 0.61, alpha: 0.5)
        polygon.strokeWidth = 7
        polygon.strokeColor = UIColor.brown
        polygon.title = "Polygon"
        polygon.map = mapView
   }
    
    func drawPolyLine(){
        
        let pathForPolyLine = GMSMutablePath()
        pathForPolyLine.add(CLLocationCoordinate2D(latitude: 16.99, longitude: 73.31))
        pathForPolyLine.add(CLLocationCoordinate2D(latitude: 17.27, longitude: 74.18))
        pathForPolyLine.add(CLLocationCoordinate2D(latitude: 16.70, longitude: 74.24))
        pathForPolyLine.add(CLLocationCoordinate2D(latitude: 16.37, longitude: 73.38))
        pathForPolyLine.add(CLLocationCoordinate2D(latitude: 16.99, longitude: 73.31))
       
        let rectangle = GMSPolyline(path: pathForPolyLine)
        rectangle.strokeColor = .cyan
        rectangle.strokeWidth = 5
        rectangle.title = "PolyLine"
        rectangle.map = mapView
    }
}


