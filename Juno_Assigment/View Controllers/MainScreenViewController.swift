//
//  MainScreenViewController.swift
//  Juno_Assigment
//
//  Created by PCS213 on 11/11/22.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var mainScreenTableView: UITableView!
    
    //Variable
    var mainScreenViewModel = MainScreenViewModel()
    var yourCryptoHoldings = [YourCryptoHoldings]()
    var cryptoPrices = [CryptoPrices]()
    var allTransactions = [AllTransactions]()

    override func viewDidLoad() {
        super.viewDidLoad()
        mainScreenTableView.estimatedRowHeight = UITableView.automaticDimension
        mainScreenViewModel.fetchCryptoData { isSuccess in
            self.mainScreenTableView.reloadData()
        }
        mainScreenTableView.register(UINib.init(nibName: "MainScreenTableViewCell", bundle: nil), forCellReuseIdentifier: "MainScreenTableViewCell")
    }
}

//MARK: TableView Delegate and Datasource methods
extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.mainScreenViewModel.cryptoPrices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = mainScreenTableView.dequeueReusableCell(withIdentifier: "MainScreenTableViewCell", for: indexPath) as! MainScreenTableViewCell
        print(self.mainScreenViewModel.cryptoPrices)
        cell.cellCryptoPrice = self.mainScreenViewModel.cryptoPrices[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
    
}
