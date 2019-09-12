//
//  PeliculaCell.swift
//  PapayitaExample
//
//  Created by Bruno Reyes on 9/10/19.
//  Copyright © 2019 Bruno Reyes. All rights reserved.
//

import UIKit
import FloatRatingView

class PeliculaCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var vwRating: FloatRatingView!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblTitulo: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
