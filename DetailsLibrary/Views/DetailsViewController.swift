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
    
    var teste: String = ""
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 0, y: 220, width: 100, height: 50))
        button.center = self.view.center
        button.backgroundColor = .black
        button.setTitle("ADICIONAR", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)

        }
    
        @objc public func buttonAction(sender: UIButton!) {
            let defaults = UserDefaults.standard
          print("TESTE DE BOTÃO")
        // aqui vamos checar o array de favoritos
            let savedArray = defaults.object(forKey: "arrayTeste") as? [String]
            print(savedArray ?? ["teste falhou"])
    }
    
}
   


extension UIViewController {
    public static var bundleUI: Bundle {
        var bundle: Bundle
        if let bundeLet = Bundle(identifier: "com.br.everis.DetailsLibrary") {
            bundle = bundeLet
        } else {
            bundle = Bundle(for: self)
        }
        return bundle
    }
    public class func fromSB() -> Self {
        return fromSB(viewType: self)
    }
    public class func fromSB<T: UIViewController>(viewType: T.Type) -> T {
        let sb = UIStoryboard(name: "Details", bundle: bundleUI)
        if let vc = sb.instantiateViewController(withIdentifier: "DetailsID") as? T {
            vc.loadViewIfNeeded()
            return vc
        }
        return T()
    }
}

public class loadStory: UIViewController {
    public static func execLoad() -> UIViewController {
        if let bundle = Bundle(identifier: "com.br.everis.DetailsLibrary") {
            let sb = UIStoryboard(name: "Details", bundle: bundle)
            let vc = sb.instantiateViewController(withIdentifier: "DetailsID") as! DetailsViewController
            vc.loadViewIfNeeded()
            return vc
        } else {
            return UIViewController()
        }
        
    }
    
}
