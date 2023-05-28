//
//  ClubCell.swift
//  FCRef
//
//  Created by Mathieu @theunknowman_80 on Twitter 27/05/2023.
//

import UIKit
import MapKit

class ClubCell: UITableViewCell {
    @IBOutlet weak var logoIv: UIImageView!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var nameClubLbl: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    
    var club: FootballClubL1!
    
    
    func setupCell(_ club: FootballClubL1) {
        self.club = club
        self.logoIv.image = UIImage(named: club.nickname)
        self.cityLbl.text = club.city
        self.nameClubLbl.text = club.name
        self.centerCard()
    }
    
    //Center the map on the stadium of the corresponding club in the cell
    
    func centerCard() {
        let stadium = self.club.stadium
        let coords = CLLocationCoordinate2D(latitude: stadium.lat, longitude: stadium.long)
        map.setRegion(MKCoordinateRegion(center: coords, span: MKCoordinateSpan(latitudeDelta: 0.20, longitudeDelta: 0.20)), animated: true)
    }
}
