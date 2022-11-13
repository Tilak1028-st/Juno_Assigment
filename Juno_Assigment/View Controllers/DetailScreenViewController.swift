//
//  DetailScreenViewController.swift
//  Juno_Assigment
//
//  Created by PCS213 on 11/11/22.
//

import UIKit
import SwiftChart
import SVGKit



class DetailScreenViewController: UIViewController {
    
    //Outlets
    @IBOutlet private weak var currentPriceLabel: UILabel!
    @IBOutlet private weak var bitCoinNameLabel: UILabel!
    @IBOutlet private weak var charView: UIView!
    @IBOutlet private weak var performanceLabel: UILabel!
    @IBOutlet private weak var coinImageView: UIImageView!
    @IBOutlet private weak var availabelCryptoLabel: UILabel!
    @IBOutlet private weak var crptoValueLabel: UILabel!
    @IBOutlet private weak var balancelabel: UILabel!
    @IBOutlet private weak var codeLabel: UILabel!
    @IBOutlet private weak var yourHoldingView: UIView!
    @IBOutlet private weak var hourButton: UIButton!
    @IBOutlet private weak var dayButton: UIButton!
    @IBOutlet private weak var MonthButton: UIButton!
    @IBOutlet private weak var YearButton: UIButton!
    @IBOutlet private weak var AllButton: UIButton!
    @IBOutlet weak var narBar: NavigationBar!
    
    
    //Variables:
    private var graphPoints: [Double] = []
    private let chart = Chart(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0.40 * UIScreen.main.bounds.height))
    private var series = ChartSeries([])
    private var svgImage: SVGKImage = SVGKImage()
    
    var yourHolding: YourCryptoHoldings? {
        didSet{
            let svgImage = URL(string: yourHolding?.logo ?? "")
            let data = try? Data(contentsOf: svgImage!)
            let nameSvgImage: SVGKImage = SVGKImage(data: data)
            
            DispatchQueue.main.async {
                self.coinImageView.image = nameSvgImage.uiImage
                self.narBar.logoImageView.image = nameSvgImage.uiImage
                self.availabelCryptoLabel.text = "Available \(self.yourHolding?.title ?? "")"
                self.crptoValueLabel.text = "\(self.yourHolding?.current_bal_in_usd ?? "") \(self.yourHolding?.title ?? "")"
                self.codeLabel?.text = "jkfnnfnn nigioiog"
                self.balancelabel.text = "$\(self.yourHolding?.current_bal_in_token ?? "")"
            }
            
        }
    }
    
    var cryptoPrice: CryptoPrices? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.bitCoinNameLabel.text = self?.cryptoPrice?.title
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpChart()
    }
    
    // function to setup initial ui of detail screen
    private func setUpUI() {
        
        //setting navigation Bar
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.narBar.containerView.backgroundColor = UIColor.white
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapOnBackButton))
        tapRecognizer.numberOfTapsRequired = 1
        self.narBar.backImageView.isUserInteractionEnabled = true
        self.narBar.backImageView.addGestureRecognizer(tapRecognizer)
        
        //Adding shadow to your holding view
        self.yourHoldingView.layer.borderWidth = 0.5
        self.yourHoldingView.layer.borderColor = UIColor.gray.cgColor
        self.yourHoldingView.layer.cornerRadius = 10.0
        
        
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named:"red_price_change.png")
        let imageOffsetY: CGFloat = -5.0
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        let completeText = NSMutableAttributedString(string: "")
        completeText.append(attachmentString)
        let textAfterIcon = NSAttributedString(string: "0.00%")
        let timeText = NSAttributedString(string: " in past 1H", attributes: [.foregroundColor: UIColor.gray])
        completeText.append(textAfterIcon)
        completeText.append(timeText)
        self.performanceLabel.textAlignment = .center
        self.performanceLabel.attributedText = completeText
        
    }
    
    @objc func didTapOnBackButton()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func didTapOnbackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: Function to set chart in detail screen
    
    private func setUpChart() {
        graphPoints = [4, 2, 1, 4, 5, 3, 4,5,6,7,6,5,6, 8,9,10,7,6,5,4,2]
        series = ChartSeries(graphPoints)
        series.color = ChartColors.blueColor()
        series.area = true
        chart.yLabels = [Double(), Double(), Double(), Double(),Double(),Double(),Double(),Double(),Double(),Double(),Double(),Double(),Double()]
        chart.xLabels = [Double(), Double(), Double(), Double(),Double(),Double(),Double(),Double(),Double(),Double(),Double(),Double(),Double()]
        chart.xLabels?.removeAll()
        chart.yLabels?.removeAll()
        chart.gridColor = UIColor.clear
        chart.add(series)
        chart.axesColor = UIColor.clear
        chart.bottomInset = 0.0
        charView.addSubview(chart)
    }
    
    
    @IBAction func didtapOn1HButton(_ sender: UIButton) {
        updateChartsDataForDifferentTime(timeGraphPoints: [4, 2, 1, 4, 5, 3, 4,5,6,7,6,5,6, 8,9,10,7,6,5,4,2])
        if !sender.isSelected {
            sender.isSelected = true
            sender.setTitleColor(UIColor.blue, for: UIControl.State.selected)
        }
        else {
            sender.isSelected = false
            sender.setTitleColor(UIColor.green, for: UIControl.State.normal)
        }
        
        dayButton.isSelected = false
        MonthButton.isSelected = false
        YearButton.isSelected = false
        AllButton.isSelected = false
    }
    
    
    @IBAction func didtapOn1DButton(_ sender: UIButton) {
        updateChartsDataForDifferentTime(timeGraphPoints: [4, 2, 1, 4, 6, 7, 2, 3, 5, 9, 1, 2, 3, 4, 5, 6, 8, 9, 7])
        if !sender.isSelected {
            sender.isSelected = true
            sender.setTitleColor(UIColor.blue, for: UIControl.State.selected)
        }
        else {
            sender.isSelected = false
            sender.setTitleColor(UIColor.green, for: UIControl.State.normal)
        }
        hourButton.isSelected = false
        MonthButton.isSelected = false
        YearButton.isSelected = false
        AllButton.isSelected = false
    }
    
    
    
    @IBAction func didTapOn1MButton(_ sender: UIButton) {
        updateChartsDataForDifferentTime(timeGraphPoints: [4, 2, 1, 4, 5, 3, 4, 1, 8, 9 ,1, 3, 7, 1, 3,10, 2, 7,5, 8, 2])
        if !sender.isSelected {
            sender.isSelected = true
            sender.setTitleColor(UIColor.blue, for: UIControl.State.selected)
        }
        else {
            sender.isSelected = false
            sender.setTitleColor(UIColor.green, for: UIControl.State.normal)
        }
        hourButton.isSelected = false
        dayButton.isSelected = false
        YearButton.isSelected = false
        AllButton.isSelected = false
    }
    
    
    @IBAction func didTapOn1YButton(_ sender: UIButton) {
        updateChartsDataForDifferentTime(timeGraphPoints: [1, 3, 5, 4, 5, 8, 6, 8, 9, 1, 2, 3,6, 4, 1, 10, 7, 6, 2, 7, 4])
        if !sender.isSelected {
            sender.isSelected = true
            sender.setTitleColor(UIColor.blue, for: UIControl.State.selected)
        }
        else {
            sender.isSelected = false
            sender.setTitleColor(UIColor.green, for: UIControl.State.normal)
        }
        hourButton.isSelected = false
        dayButton.isSelected = false
        MonthButton.isSelected = false
        AllButton.isSelected = false
    }
    
    
    @IBAction func didTapOnAllButton(_ sender: UIButton) {
        updateChartsDataForDifferentTime(timeGraphPoints: [4, 2, 1, 1, 5, 3, 2,5,8,7,4,5,6, 2,9,10,7,6,7,9,2])
        if !sender.isSelected {
            sender.isSelected = true
            sender.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        }
        else {
            sender.isSelected = false
            sender.setTitleColor(UIColor.green, for: UIControl.State.normal)
        }
        hourButton.isSelected = false
        dayButton.isSelected = false
        MonthButton.isSelected = false
        YearButton.isSelected = false
    }
    
    
    //MARK: function to change graphs values for different 1H, 1H, 1M etc.
    
    private func updateChartsDataForDifferentTime(timeGraphPoints: [Double]) {
        DispatchQueue.main.async { [weak self] in
            self?.chart.removeAllSeries()
            self?.graphPoints =  timeGraphPoints
            self?.series = ChartSeries(self!.graphPoints)
            self?.series.area = true
            self?.chart.add(self!.series)
            self?.chart.reloadInputViews()
            self?.charView.reloadInputViews()
        }
    }
}

