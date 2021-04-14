//
//  UIViewExt.swift
//  QuizApp
//
//  Created by Ursa Crnjak on 13/04/2021.
//

import UIKit

extension UIView {
    
    func pin() {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: topAnchor, constant: 400).isActive = true
        leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        //bottomAnchor.constraint(equalTo: superview!.bottomAnchor).isActive = true
    }
}
