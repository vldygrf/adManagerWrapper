//
//  ViewController.swift
//  AdManagerWrapper
//
//  Created by Vladislav Garifulin on 07.09.2022.
//

import UIKit
import AdManager

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tap(sender:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        AdBridgeUser.initializeNativeAdUnitId("3bbcad319119c469", nativeAdRefreshRate: 15.0)
    }
    
    @objc
    func tap(sender: AnyObject) {
        let rnd = Int.random(in: 0..<2)
        if rnd == 0 {
            AdBridgeUser.clearBanner()
        } else if rnd == 1 {
            AdBridgeUser.createBanner(withSize: 200, orientation: Bool.random() ? .vertical : .horizontal, leftTopAlignment: Bool.random() ? .same : .opposite)
        } else {
            AdBridgeUser.setBannerAlignment(Bool.random() ? .same : .opposite)
        }
    }
}

