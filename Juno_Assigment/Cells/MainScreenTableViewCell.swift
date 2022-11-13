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
            self.currentPriceLabel.text = "$\(cellCryptoPrice?.current_price_in_usd ?? "")"
            let SVGCoder = SDImageSVGCoder.shared
            SDImageCodersManager.shared.addCoder(SVGCoder)
            
            
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
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        logoImageView.layer.cornerRadius = logoImageView.frame.height/2
        miniGraphImageView.layer.cornerRadius = miniGraphImageView.frame.height/2
        setDataIntoPriceChangedLabel()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: -> Function to change price
    
    private func setDataIntoPriceChangedLabel() {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named:"green_price_change.png")
        let imageOffsetY: CGFloat = -5.0
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        let completeText = NSMutableAttributedString(string: "")
        completeText.append(attachmentString)
        let textAfterIcon = NSAttributedString(string: "0.00%")
        completeText.append(textAfterIcon)
        self.priceChangeLabel.textAlignment = .center
        self.priceChangeLabel.attributedText = completeText
    }
}
