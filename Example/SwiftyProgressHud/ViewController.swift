//
//  ViewController.swift
//  SwiftyProgressHud
//
//  Created by Atif on 12/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit
import SwiftyProgressHud

class ViewController: UIViewController {
    @IBOutlet weak var subViewContainer: UIView!
    var hud: SwiftyProgressHud!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hud = SwiftyProgressHud()
    }
    
    @IBAction func showHud(_ sender: Any) {
        hud.text = "Loading.."
        hud.show(view: self.view)
        self.perform(#selector(removeHud), with: nil, afterDelay: 3.0)
    }
    
    @objc func removeHud() {
        hud.hide()
    }
}
