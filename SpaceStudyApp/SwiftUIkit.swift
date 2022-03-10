//
//  SwiftUIkit.swift
//  SpaceStudyApp
//
//  Created by Mac on 02.11.2021.
//

import UIKit
import SwiftUI

class SwiftUIkit: UIViewController {
    
    @IBOutlet weak var theContainer : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let childView = UIHostingController(rootView: SwiftUIView())
        addChild(childView)
        childView.view.frame = theContainer.bounds
        theContainer.addSubview(childView.view)

    }

}
