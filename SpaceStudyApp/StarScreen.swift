//
//  StarScreen.swift
//  SpaceStudyApp
//
//  Created by Mac on 27.10.2021.
//

import UIKit
import WebKit

class StarScreen: UIViewController {

    @IBOutlet weak var ViewCard: UIView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var CardToAR: UIView!
    @IBOutlet weak var img: UIImageView!
    
    
    var link = "https://www.youtube.com/embed/EFO_bsg1sw8"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ViewCard.layer.cornerRadius = 35
        
        CardToAR.layer.cornerRadius = 35
        
        img.layer.cornerRadius = 35
        
        webView.load(URLRequest(url: URL(string: link)!))
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
