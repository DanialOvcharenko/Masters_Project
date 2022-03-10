//
//  MoonSunScreen.swift
//  SpaceStudyApp
//
//  Created by Mac on 28.10.2021.
//

import UIKit

class MoonSunScreen: UIViewController {
    
    @IBOutlet weak var BView: UIView!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BView.layer.cornerRadius = 35
        Button1.layer.borderWidth = 5
        Button1.layer.cornerRadius = 30
        Button2.layer.cornerRadius = 30
        Button2.layer.borderWidth = 5
        
        // Do any additional setup after loading the view.
    }
}
/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/
