//
//  RepresentativeTableViewCell.swift
//  Representative
//
//  Created by XMS_JZhan on 2/7/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateViews() {
        guard let representative = representative else { return }
        self.nameLabel.text = representative.name
        self.partyLabel.text = representative.party
        self.districtLabel.text = representative.district
        self.websiteLabel.text = representative.link
        self.phoneNumberLabel.text = representative.phone
    }

}
