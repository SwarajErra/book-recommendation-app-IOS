//
//  DismissSegue.swift
//  BookRec


import UIKit

@objc(DismissSegue) class DismissSegue: UIStoryboardSegue {
    
    override func perform() {
        if let controller = source.presentingViewController {
            controller.dismiss(animated: true, completion: nil)
        }
    }
}
