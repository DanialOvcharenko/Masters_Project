//
//  MarsScreen.swift
//  SpaceStudyApp
//
//  Created by Mac on 31.10.2021.
//

import UIKit
import WebKit

class MarsScreen: UIViewController {

    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var View2: UIView!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    var link = "https://www.youtube.com/embed/D8pnmwOXhoY"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        View1.layer.cornerRadius = 35
        View2.layer.cornerRadius = 35
        
        Button2.layer.cornerRadius = 35
        Button1.layer.cornerRadius = 35
        
        webView.load(URLRequest(url: URL(string: link)!))
    }

}
