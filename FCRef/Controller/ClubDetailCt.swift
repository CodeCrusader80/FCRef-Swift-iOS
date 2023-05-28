//
//  ClubDetailCt.swift
//  FCRef
//
//  Created by Mathieu @theunknowman_80 on Twitter 27/05/2023.
//

import UIKit
import MapKit

class ClubDetailCt: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var logoIv: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var stadiumNameLbl: UILabel!
    @IBOutlet weak var stadiumCapacityLbl: UILabel!
    @IBOutlet weak var coupe1: UILabel!
    @IBOutlet weak var coupe2: UILabel!
    @IBOutlet weak var coupe3: UILabel!
    
    var club: FootballClubL1!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoIv.image = UIImage(named: club.nickname)
        nameLbl.text = club.name
        cityLbl.text = club.city
        descLbl.text = club.desc
        stadiumNameLbl.text = club.stadium.name
        stadiumCapacityLbl.text = "Capacité \(club.stadium.capacity)";
        
        //We use a series of conditions to prevent unnecessary text from being displayed in case of an empty array. For this purpose, all three labels are checked, and if one, two, or all three of them are supposed to be empty, they are not displayed in the view.
        
        if club.championnatDeFrance.isEmpty {
            coupe1.isHidden = true
        } else {
            coupe1.text = convertArrayIntToString(club.championnatDeFrance, "Coupe de la ligue")
        }
        
        if club.coupeDeFrance.isEmpty {
            coupe2.isHidden = true
        } else {
            coupe2.text = convertArrayIntToString(club.coupeDeFrance, "Coupe de France")
            coupe2.isHidden = false
        }
        
        if club.championLeagueUEFA.isEmpty {
            coupe3.isHidden = true
        } else {
            coupe3.text = convertArrayIntToString(club.championLeagueUEFA, "League des champions")
            coupe3.isHidden = false
        }
        centerMap()
    }
    
    //We ensure that the map is centered and zoomed in close to the stadium corresponding to the displayed club.
    
    func centerMap(){
        let span = MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.5)
        let center = CLLocationCoordinate2D(latitude: club.stadium.lat, longitude: club.stadium.long)
        let region = MKCoordinateRegion(center: center, span: span)
        map.setRegion(region, animated: true)
    }
    
    
    //This function converts an int to a string, allowing it to be displayed in a UILabel.
    
    func convertArrayIntToString(_ array: [Int], _ extra: String) -> String {
        var str = "\(extra) \(array.count)"
        array.forEach { i in
            if i == array[0] {
                str += ": \(i)"
            } else {
                str += ", \(i)"
            }
        }
        return str
    }
    
}
