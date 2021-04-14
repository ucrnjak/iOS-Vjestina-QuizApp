//
//  QuizCell.swift
//  QuizApp
//
//  Created by Ursa Crnjak on 13/04/2021.
//

import UIKit

class  QuizCell: UITableViewCell {
    
    //var cellView = UIView()
    var quizTitle = UILabel()
    var quizDescription = UILabel()
    var quizImage = UIImageView()
    //var levelOfDifficulty = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(quizTitle)
        addSubview(quizDescription)
        addSubview(quizImage)
        //addSubview(levelOfDifficulty)
        
        configureTitle()
        configureDescription()
        configureImage()
        //configureLevel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(quiz: Quiz) {
        quizTitle.text = quiz.title
        quizDescription.text = quiz.description
        
//        let url = URL(string: quiz.imageUrl)
//
//        DispatchQueue.global().async {
//            let data = try? Data(contentsOf: url!)
//            DispatchQueue.main.async {
//                self.quizImage.image = UIImage(data: data!)
//            }
//        }
        
    }
    
    func configureTitle() {
        quizTitle.numberOfLines = 0
        quizTitle.font = UIFont(name: "SourceSansPro", size: 20)
        quizTitle.font = UIFont.boldSystemFont(ofSize: 20)
        quizTitle.textColor = .white
        
        quizTitle.translatesAutoresizingMaskIntoConstraints = false
        quizTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 160).isActive = true
        quizTitle.topAnchor.constraint(equalTo: topAnchor, constant: 26).isActive = true
        //title.heightAnchor.constraint(equalToConstant: 25).isActive = true
        quizTitle.widthAnchor.constraint(equalToConstant: 165).isActive = true
    
    }
    
    func configureDescription() {
        quizDescription.font = UIFont.systemFont(ofSize: 12)
        quizDescription.font = UIFont(name: "SourceSansPro", size: 12)
        quizDescription.textColor = .white
        quizDescription.numberOfLines = 0
        
        quizDescription.translatesAutoresizingMaskIntoConstraints = false
        quizDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 160).isActive = true
        quizDescription.topAnchor.constraint(equalTo: quizTitle.bottomAnchor, constant: 5).isActive = true
        quizDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18).isActive = true
    }
    
    func configureImage() {
        quizImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        quizImage.heightAnchor.constraint(equalToConstant: 103).isActive = true
        quizImage.widthAnchor.constraint(equalToConstant: 103).isActive = true
        quizImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
//    func configureLevel() {
//        levelOfDifficulty.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        levelOfDifficulty.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 120).isActive = true
//        levelOfDifficulty.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 268).isActive = true
//        levelOfDifficulty.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 30).isActive = true
//    }


}

