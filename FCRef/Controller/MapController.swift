//
//  MapController.swift
//  FCRef
//
//  Created by Mathieu @theunknowman_80 on Twitter 27/05/2023.
//

import UIKit
import MapKit

class MapController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var map : MKMapView!
    
    var allStadiums: [Stadium] = DatasL1.get.allStadiums
    var id = "MapToDetail"
    
    
    // This page controls the map section and allows for adding the annotations we created in AnnotationView, as well as the club logos by accessing the allStadium array created in the Data file. We also use the two buttons created in the annotation view to display them in the popup.

    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        allStadiums.forEach { stadium in
            let anno = StadiumAnnotation(stadium)
            map.addAnnotation(anno)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(notificationObserver), name: Notification.Name("Center"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notificationObserver), name: Notification.Name("Detail"), object: nil)
    }
    
    //We associate the identifier create on Storyboard to redirect the user who clicks on the magnifying glass to the detail page of the selected club directly from the map.
    
    @objc func notificationObserver(_ notification: Notification) {
        if let notif = notification.object as? MKCoordinateRegion {
            map.setRegion(notif, animated: true)
        } else if let notif = notification.object as? FootballClubL1 {
            performSegue(withIdentifier: id, sender: notif)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let idbis = "ID"
        var view: AnnotationView
        if let anno = annotation as? StadiumAnnotation {
            if let b = mapView.dequeueReusableAnnotationView(withIdentifier: idbis) as? AnnotationView {
                b.annotation = anno
                view = b
            } else {
                view = AnnotationView(annotation: annotation, reuseIdentifier: idbis)
            }
            view.update(annotation)
            return view
        }
        return MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: idbis)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == id {
            if let next = segue.destination as? ClubDetailCt {
                next.club = sender as? FootballClubL1
            }
        }
    }

}
