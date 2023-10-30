//
//  NewReleaseTableViewCell.swift
//  MusicRelease
//
//  Created by ktaguchi on 2023/10/20.
//

import UIKit

class NewReleaseTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContent(model: NewReleaseModel) {
        titleLabel.text = model.title
    }
    
}
