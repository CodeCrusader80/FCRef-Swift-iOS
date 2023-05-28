//
//  Clubs.swift
//  FCRef
//
//  Created by Mathieu @theunknowman_80 on 27/05/2023.
//

import Foundation

// Struct for datas about football clubs, the nickname var is using for assets, so the name need to using the same for the logo of club.


struct FootballClubL1 {
    var name: String
    var nickname: String
    var city: String
    var stadium: Stadium
    var desc: String
    var championnatDeFrance: [Int]
    var coupeDeFrance: [Int]
    var championLeagueUEFA: [Int]
    var europaLeagueUEFA: [Int]
}
