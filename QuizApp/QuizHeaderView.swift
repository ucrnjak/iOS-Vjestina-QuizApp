//
//  QuizHeaderView.swift
//  QuizApp
//
//  Created by Ursa Crnjak on 14/04/2021.
//

import UIKit

class QuizHeaderView: UITableViewHeaderFooterView {
    let title = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
            title.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(title)
            title.heightAnchor.constraint(equalToConstant: 70).isActive = true
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
            title.backgroundColor = .clear
        title.textColor = #colorLiteral(red: 0.137254902, green: 0.3294117647, blue: 0.4823529412, alpha: 1)
        }
    }
