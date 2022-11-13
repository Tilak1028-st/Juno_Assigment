//
//  MainScreenViewController.swift
//  Juno_Assigment
//
//  Created by PCS213 on 11/11/22.
//

import UIKit
import SVGKit
import SDWebImageSVGCoder


class MainScreenViewController: UIViewController {
    //Outlets
    @IBOutlet  weak var mainScreenTableView: UITableView!
    
    //Variable
    var mainScreenViewModel = MainScreenViewModel()
    var yourCryptoHoldings = [YourCryptoHoldings]()
    var cryptoPrices = [CryptoPrices]()
    var allTransactions = [AllTransactions]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initailSetUp()
    }
    
    
    //Function to setup initial screen
    private func initailSetUp() {
        mainScreenTableView.estimatedRowHeight = UITableView.automaticDimension
        mainScreenViewModel.fetchCryptoData { isSuccess in
            self.mainScreenTableView.reloadData()
        }
        mainScreenTableView.register(UINib.init(nibName: ConstantString.mainScreenTableViewCell, bundle: nil), forCellReuseIdentifier: ConstantString.mainScreenTableViewCell)
    }
}


//MARK: -> TableView Delegate and Datasource methods

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.mainScreenViewModel.cryptoPrices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainScreenTableView.dequeueReusableCell(withIdentifier: ConstantString.mainScreenTableViewCell, for: indexPath) as! MainScreenTableViewCell
        if indexPath.row == 0 {
            cell.logoImageView.image = UIImage(named: "bitcoin.png")
        }
        else {
            cell.logoImageView.sd_setImage(with: URL(string: self.mainScreenViewModel.cryptoPrices[indexPath.row].logo ?? ""))
        }
        cell.cellCryptoPrice = self.mainScreenViewModel.cryptoPrices[indexPath.row]
        cell.shortNameLabel.text = self.mainScreenViewModel.yourCryptoHoldings[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = self.storyboard?.instantiateViewController(withIdentifier: ConstantString.detailScreenVc) as! DetailScreenViewController
        detailVc.cryptoPrice = mainScreenViewModel.cryptoPrices[indexPath.row]
        detailVc.yourHolding = mainScreenViewModel.yourCryptoHoldings[indexPath.row]
        self.navigationController?.pushViewController(detailVc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
