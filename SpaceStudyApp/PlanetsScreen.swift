//
//  PlanetsScreen.swift
//  SpaceStudyApp
//
//  Created by Mac on 30.10.2021.
//

import UIKit

class PlanetsScreen: UIViewController {

    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        View1.layer.cornerRadius = 35
        Button1.layer.borderWidth = 5
        Button1.layer.cornerRadius = 30
        Button2.layer.cornerRadius = 30
        Button2.layer.borderWidth = 5
        Button3.layer.cornerRadius = 30
        Button3.layer.borderWidth = 5
    }


}
