//
//  DetailsViewController.swift
//  DetailsLibrary
//
//  Created by Elisa Camillo on 15/04/21.
//

import UIKit

public class DetailsViewController: UIViewController {
    
    @IBOutlet weak var coinAbbreviation: UILabel!
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var coinValue: UILabel!
    @IBOutlet weak var favoritesButton: UIView!
    @IBOutlet weak var lastHour: UILabel!
    @IBOutlet weak var lastDay: UILabel!
    @IBOutlet weak var lastMonth: UILabel!
    
    var teste: String = ""
    var sigla: String = ""
    var isFavorite: Bool = false
    let defaults = UserDefaults.standard
    var arrayOfFav:[String] = []
    @IBOutlet weak var button: UIButton!
    
    public override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    public override func viewDidLayoutSubviews(){
//        button.layer.cornerRadius = 5
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor.white.cgColor
//        button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 25, bottom: 15, right: 25)

    }

//    public override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//
//        // recuperando o array de favoritos
//        let savedArray = defaults.object(forKey: "arrayTeste") as? [String]
//        arrayOfFav = savedArray!
//        print(arrayOfFav)
//
//        // se o array contém essa moeda, título do botão muda
//        if let bool = savedArray?.contains("mais outro favorito") {
//            if(bool == true) {
//                button.setTitle("REMOVER", for: .normal)
//                isFavorite = true
//            }
//        }
//    }
    
    public init(sigla: String) {
        self.teste = sigla
        print(self.teste)
        self.coinAbbreviation?.text = sigla
        super.init(nibName: nil, bundle: nil)
        
        // aqui passaria a sigla da inicialização para a variavel local sigla
        
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        let provider = DetailsAPI()
        
        let a = "placeholder"
        
        provider.getDetails(abrevDetails: a, completion: {(result) in
            print(result.name!)
        })
    }
    
    
    
    public required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
    }
    
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
    
    
//    @IBAction func addOrRemove(_ sender: Any) {
//        if(isFavorite) {
//            if let index = arrayOfFav.firstIndex(of: "mais um outro favorito") {
//                arrayOfFav.remove(at: index)
//                defaults.setValue(arrayOfFav, forKey: "arrayTeste")
//            }
//            button.setTitle("ADICIONAR", for: .normal)
//
//        } else {
//            arrayOfFav.append("outro favorito")
//            defaults.setValue(arrayOfFav, forKey: "arrayTeste")
//            viewWillAppear(true)
//        }
//    }
    
    
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
