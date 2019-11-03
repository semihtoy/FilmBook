//
//  SearchCell.swift
//  FilmsBook
//
//  Created by Xcode on 25.10.2019.
//  Copyright © 2019 Xcode. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var FilmPoster: UIImageView!
    @IBOutlet weak var FilmNameLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var SkorLabel: UILabel!
    @IBOutlet weak var YearLabel: UILabel!
    @IBOutlet weak var DetailView: UITextView!
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
