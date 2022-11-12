//
//  MainScreenTableViewCell.swift
//  Juno_Assigment
//
//  Created by PCS213 on 12/11/22.
//

import UIKit
import SVGKit
import SDWebImageSVGCoder


class MainScreenTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var shortNameLabel: UILabel!
    @IBOutlet weak var priceChangeLabel: UILabel!
    @IBOutlet weak var miniGraphImageView: UIImageView!
    
    
    var cellCryptoPrice: CryptoPrices? {
        didSet {
            self.titleLabel.text = cellCryptoPrice?.title
          //  let svgImage = URL(string: cellCryptoPrice?.logo ?? "")
            self.currentPriceLabel.text = "$\(cellCryptoPrice?.current_price_in_usd ?? "")"
            
            
            if cellCryptoPrice?.current_price_in_usd == "1.00" {
                let minImage = URL(string: "file:///Users/pcs213/Downloads/line.svg")
                let data1 = try? Data(contentsOf: minImage!)
                let SvgImage: SVGKImage = SVGKImage(data: data1)
                self.miniGraphImageView.image = SvgImage.uiImage
            }
            else {
                let minImage = URL(string: "file:///Users/pcs213/Downloads/up%20down%20line.svg")
                let data1 = try? Data(contentsOf: minImage!)
                let SvgImage: SVGKImage = SVGKImage(data: data1)
                self.miniGraphImageView.image = SvgImage.uiImage
            }
            let SVGCoder = SDImageSVGCoder.shared
            SDImageCodersManager.shared.addCoder(SVGCoder)
//             load SVG url
//            let imageView: UIImageView = UIImageView()
//            imageView.sd_setImage(with: svgImage!)
//
//            let data = try? Data(contentsOf: svgImage!)
//            let nameSvgImage: SVGKImage = SVGKImage(data: data)
            DispatchQueue.main.async {
                self.logoImageView.sd_setImage(with: URL(string: "\(self.cellCryptoPrice?.logo ?? "")"))
                
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
