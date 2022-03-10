//
//  SunScreen.swift
//  SpaceStudyApp
//
//  Created by Mac on 29.10.2021.
//

import UIKit
import WebKit

class SunScreen: UIViewController {

    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var View2: UIView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    
    var link = "https://www.youtube.com/embed/2HoTK_Gqi2Q"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        View1.layer.cornerRadius = 35
        View2.layer.cornerRadius = 35
        
        Button2.layer.cornerRadius = 35
        Button1.layer.cornerRadius = 35
        
        webView.load(URLRequest(url: URL(string: link)!))

    }
}
