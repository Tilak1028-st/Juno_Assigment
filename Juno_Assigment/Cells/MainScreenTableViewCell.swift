//
//  MainScreenTableViewCell.swift
//  Juno_Assigment
//
//  Created by PCS213 on 12/11/22.
//

import UIKit
import SVGKit


class MainScreenTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var shortNameLabel: UILabel!
    @IBOutlet weak var priceChangeLabel: UILabel!
    @IBOutlet weak var miniGraphImageView: UIImageView!
    
    
    var cellCryptoPrice: CryptoPrices? {
        didSet {
           // self.logoImageView.image = cellCryptoPrice?.logo
            self.titleLabel.text = cellCryptoPrice?.title
            self.currentPriceLabel.text = "$\(cellCryptoPrice?.current_price_in_usd ?? "")"
            let svgImage = URL(string: cellCryptoPrice?.logo ?? "")
            let data = try? Data(contentsOf: svgImage!)
            let nameSvgImage: SVGKImage = SVGKImage(data: data)
            
            DispatchQueue.main.async {
                self.logoImageView.image = nameSvgImage.uiImage
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        logoImageView.layer.cornerRadius = logoImageView.frame.height/2
        miniGraphImageView.layer.cornerRadius = miniGraphImageView.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
