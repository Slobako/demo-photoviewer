//
//  UIViewController-Extension.swift
//  PhotoViewer
//
//  Created by Slobodan Kovrlija on 5/29/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlertWith(message: String) {
        let alert = UIAlertController.init(title: "Nothing more there!",
                                           message: message,
                                           preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .cancel,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
