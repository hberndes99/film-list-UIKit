//
//  NewFilmViewController.swift
//  l4-practise-tableView
//
//  Created by Harriette Berndes on 22/06/2021.
//

import UIKit

class NewFilmViewController: UIViewController {
    
    var titleInputLabel: UITextField!
    var submitButton: UIButton!
    var isDismissed: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        titleInputLabel = UITextField()
        titleInputLabel.translatesAutoresizingMaskIntoConstraints = false
        titleInputLabel.placeholder = "Enter the film title"
        
        view.addSubview(titleInputLabel)
        
        submitButton = UIButton()
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle("add film", for: .normal)
        submitButton.backgroundColor = .red
        submitButton.addTarget(self, action: #selector(addFilm), for: .touchUpInside)
        
        view.addSubview(submitButton)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleInputLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleInputLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.centerYAnchor.constraint(equalTo: titleInputLabel.bottomAnchor, constant: 40)
        ])
    }
    
    @objc func addFilm() {
        print("add this film pls")
        
        let newTitle = titleInputLabel.text
        if let newTitle = newTitle {
            let newFilm = Film(title: newTitle, releaseDate: 2000, rating: .good)
            films.append(newFilm)
            self.isDismissed?()
            dismiss(animated: true)
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
