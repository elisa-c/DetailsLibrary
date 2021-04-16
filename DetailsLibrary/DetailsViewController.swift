//
//  DetailsViewController.swift
//  DetailsLibrary
//
//  Created by Elisa Camillo on 15/04/21.
//

import UIKit

public class DetailsViewController: UIViewController {

    @IBOutlet weak var coinAbbreviation: UILabel!
    @IBOutlet weak var borderButton: UIView!
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var coinValue: UILabel!
    @IBOutlet weak var favoritesButton: UIView!
    @IBOutlet weak var lastHour: UILabel!
    @IBOutlet weak var lastDay: UILabel!
    @IBOutlet weak var lastMonth: UILabel!
    
        
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // adiciona borda à view que contém o botão
        borderButton.layer.borderWidth = 10
        borderButton.layer.borderColor = UIColor.white.cgColor

    }
    

}
