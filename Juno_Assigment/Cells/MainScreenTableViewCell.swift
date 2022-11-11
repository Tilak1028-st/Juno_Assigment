//
//  MainScreenTableViewCell.swift
//  Juno_Assigment
//
//  Created by PCS213 on 12/11/22.
//

import UIKit
import SVGKit
import SVGParser

class MainScreenTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var shortNameLabel: UILabel!
    @IBOutlet weak var priceChangeLabel: UILabel!
    
    
    var cellCryptoPrice: CryptoPrices? {
        didSet {
           // self.logoImageView.image = cellCryptoPrice?.logo
            self.titleLabel.text = cellCryptoPrice?.title
            self.currentPriceLabel.text = cellCryptoPrice?.current_price_in_usd
          
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
