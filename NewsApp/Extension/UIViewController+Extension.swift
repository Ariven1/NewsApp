//
//  UIViewController+Extension.swift
//  NewsApp
//
//  Created by Ariven on 13/09/24.
//

import UIKit

extension UIViewController {
    func presentAlert(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: StringConstant.ok, style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
