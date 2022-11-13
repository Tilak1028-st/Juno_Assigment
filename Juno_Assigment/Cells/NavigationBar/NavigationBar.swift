//
//  NavigationBar.swift
//  Taskly
//
//  Created by PCS213 on 05/07/22.
//

import UIKit

class NavigationBar: UIView
{
    //Outlets
    @IBOutlet var backImageView: UIView!
    @IBOutlet weak var depositView: UIView!
    @IBOutlet weak var withdrawView: UIView!
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commitInit()
    }
    
    private func commitInit()
    {
        Bundle.main.loadNibNamed("NavigationBar", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        withdrawView.layer.borderWidth = 0.75
        withdrawView.layer.borderColor = UIColor.purple.cgColor
        withdrawView.layer.cornerRadius = 10.0
        
        depositView.layer.borderWidth = 0.75
        depositView.layer.borderColor = UIColor.purple.cgColor
        depositView.layer.cornerRadius = 10.0
    }
}
