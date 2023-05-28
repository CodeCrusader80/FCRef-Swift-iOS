//
//  AnnotationView.swift
//  FCRef
//
//  Created by Mathieu @theunknowman_80 on Twitter on 27/05/2023.
//

import UIKit
import MapKit

class AnnotationView: MKAnnotationView {

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        image = getImage()
        frame.size = CGSize(width: 18, height: 20)
        canShowCallout = true
        leftCalloutAccessoryView = UIButton.systemButton(with: UIImage(systemName: "globe")!, target: self, action: #selector(centerMap))
        rightCalloutAccessoryView = UIButton.systemButton(with: UIImage(systemName: "magnifyingglass")!, target: self, action: #selector(toClubDetail))
    }
    
    func update(_ annotation: MKAnnotation) {
        self.annotation = annotation
        setup()
    }
    
    func getImage() -> UIImage? {
        if let club = DatasL1.get.allClubsL1.first(where: {$0.stadium.name == annotation!.title}) {
            return UIImage(named: club.nickname)
        }
        return nil
    }
    
    @objc func centerMap() {
        let center = annotation!.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: center, span: span)
        NotificationCenter.default.post(name: Notification.Name("Center"), object: region)
    }
    
    @objc func toClubDetail() {
        let club = DatasL1.get.allClubsL1.first(where: {$0.stadium.name == annotation!.title})
        NotificationCenter.default.post(name: Notification.Name("Detail"), object: club)
    }
    
}
