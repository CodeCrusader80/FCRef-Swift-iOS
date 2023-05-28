//
//  ClubsController.swift
//  FCRef
//
//  Created by Mathieu @theunknowman_80 on Twitter 27/05/2023.
//

import UIKit

class ClubsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var clubsTableView: UITableView!
    
    let id = "TableViewToDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clubsTableView.delegate = self
        clubsTableView.dataSource = self
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return DatasL1.get.allClubsL1.count
        }
        
        
        //Use the identifier create in main for the custom cell and the name of View who as the controller of the Cell, in this exemple "ClubCell".
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let club = DatasL1.get.allClubsL1[indexPath.section]
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Club") as? ClubCell {
                cell.setupCell(club)
                return cell
            }
            return UITableViewCell()
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 90
        }
    
    //Here as well, we use a reuseIdentifier specified in the storyboard to redirect the user to the detail page of the selected club.
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let club = DatasL1.get.allClubsL1[indexPath.section]
            performSegue(withIdentifier: id, sender: club)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == id {
                if let detail = segue.destination as? ClubDetailCt {
                    detail.club = sender as? FootballClubL1
                }
            }
        }
    }
