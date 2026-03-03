//
//  Utils.swift
//  DeliveryApp
//
//  Created by Nguyen Trong Nghia on 19/2/26.
//

import Foundation
import UIKit

extension UIApplication {
    var rootViewController: UIViewController? {
        guard
            let scene = connectedScenes.first as? UIWindowScene,
            let root = scene.windows.first?.rootViewController
        else { return nil }
        
        return root
    }
}
