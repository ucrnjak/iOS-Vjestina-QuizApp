//
//  QuizzesViewController.swift
//  QuizApp
//
//  Created by Ursa Crnjak on 13/04/2021.
//


//Napomena: Zao mi je na nepotpunoj zadaci, kasno sam krenula pa nisam stigla :(
//Obecajem popraviti za iduci put :)

import UIKit
import SnapKit

class QuizzesViewController: UIViewController, ConstraintRelatableTarget {
    
    var popQuizLabel: UILabel!
    var getQuizButton: UIButton!
    var funFactLabel: UILabel!
    var funFactText: UILabel!
    var tableView = UITableView()
    var quizes: [Quiz] = []
    var quizesByCategory = [[Quiz](), [Quiz]()]
    var categories = [Int: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        quizes = DataService().fetchQuizes()
        for quiz in quizes {
            if quiz.category == .sport {
                quizesByCategory[0].append(quiz)
            }
            else if quiz.category == .science {
                quizesByCategory[1].append(quiz)
            }
        }
        
        
        buildLabel()
        buildButton()
        buildFunFactLabel()
        buildFunFactText()
        configureTableView()
    }

    private func buildLabel() {
        
        popQuizLabel = UILabel()
        popQuizLabel.text = "PopQuiz"
        popQuizLabel.textColor = .white
        popQuizLabel.font = UIFont(name: "SourceSansPro", size: 24.0)
        popQuizLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        popQuizLabel.textAlignment = .center
        view.addSubview(popQuizLabel)
        
        //constraints
        popQuizLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(90)
        }
    }
    
    private func buildButton() {
        
        getQuizButton = UIButton()
        getQuizButton.setTitle("Get Quiz", for: .normal)
        getQuizButton.backgroundColor = .white
        getQuizButton.layer.cornerRadius = 22
        getQuizButton.clipsToBounds = true
        getQuizButton.setTitleColor(#colorLiteral(red: 0.137254902, green: 0.3294117647, blue: 0.4823529412, alpha: 1), for: .normal)
        getQuizButton.setTitleColor(#colorLiteral(red: 0.6666666667, green: 0.8117647059, blue: 0.8156862745, alpha: 1), for: .selected)
        getQuizButton.titleLabel?.font = UIFont(name: "SourceSansPro", size: 20.0)
        getQuizButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        view.addSubview(getQuizButton)
        //getQuizButton.addTarget(self, action: #selector(self.getQuizButtonPressed(_:)), for: .touchUpInside)
        
        //constraints
        getQuizButton.translatesAutoresizingMaskIntoConstraints = false
        getQuizButton.topAnchor.constraint(equalTo: popQuizLabel.bottomAnchor, constant: 40).isActive = true
        getQuizButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32).isActive = true
        getQuizButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32).isActive = true
    }
    
    private func buildFunFactLabel() {
        funFactLabel = UILabel()
        funFactLabel.text = "💡 Fun Fact"
        funFactLabel.textColor = .white
        funFactLabel.font = UIFont(name: "SourceSansPro", size: 24.0)
        funFactLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        funFactLabel.backgroundColor = .clear
        view.addSubview(funFactLabel)
        
        //constraints
        funFactLabel.translatesAutoresizingMaskIntoConstraints = false
        funFactLabel.topAnchor.constraint(equalTo: getQuizButton.bottomAnchor, constant: 60).isActive = true
        funFactLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
    }
    
    func buildFunFactText() {
        funFactText = UILabel()
        funFactText.text = "There are 48 questions that contain the word “NBA”"
        funFactText.textColor = .white
        funFactText.font = UIFont(name: "SourceSansPro", size: 18.0)
        funFactText.backgroundColor = .clear
        view.addSubview(funFactText)
        
        //constraints
        funFactText.translatesAutoresizingMaskIntoConstraints = false
        funFactText.topAnchor.constraint(equalTo: funFactLabel.bottomAnchor, constant: 0).isActive = true
        funFactText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        funFactText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        funFactText.numberOfLines = 0
        funFactText.lineBreakMode = .byWordWrapping
        funFactText.heightAnchor.constraint(equalToConstant: 46).isActive = true
    }
    
    func assignbackground() {
            let background = UIImage(named: "Untitled design (1)")

            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
            imageView.contentMode =  UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = true
        tableView.rowHeight = 143
        tableView.backgroundColor = .clear
        tableView.register(QuizCell.self, forCellReuseIdentifier: "QuizCell")
        tableView.register(QuizHeaderView.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        
        //constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: funFactText.bottomAnchor, constant: 72).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
}

extension QuizzesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizesByCategory[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return quizesByCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as! QuizCell
        let quiz = quizes[indexPath.row]
        cell.set(quiz: quiz)
        cell.backgroundColor = UIColor(white: 1, alpha: 0.4)
        return cell
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                   "sectionHeader") as! QuizHeaderView
        switch section {
        case 0:
            view.textLabel?.text = "Sport"
        default:
            view.textLabel?.text = "Science"
        }
        view.textLabel?.textColor = #colorLiteral(red: 0.137254902, green: 0.3294117647, blue: 0.4823529412, alpha: 1)

       return view
    }
    
    
}
