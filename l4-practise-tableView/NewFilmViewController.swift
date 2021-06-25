//
//  NewFilmViewController.swift
//  l4-practise-tableView
//
//  Created by Harriette Berndes on 22/06/2021.
//

import UIKit

protocol NewFilmViewControllerDelegate: AnyObject {
    func addFilmToList(film: Film)
}

class NewFilmViewController: UIViewController {
    
    private var titleInputLabel: UITextField!
    private var releaseDateInputField: UITextField!
    private var submitButton: UIButton!
    weak var addFilmDelegate: NewFilmViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        titleInputLabel = UITextField()
        titleInputLabel.translatesAutoresizingMaskIntoConstraints = false
        titleInputLabel.placeholder = "Enter the film title"
        
        view.addSubview(titleInputLabel)
        
        releaseDateInputField = UITextField()
        releaseDateInputField.translatesAutoresizingMaskIntoConstraints = false
        releaseDateInputField.placeholder = "Enter year of release"
        
        view.addSubview(releaseDateInputField)
        
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
            submitButton.centerYAnchor.constraint(equalTo: titleInputLabel.bottomAnchor, constant: 70)
        ])
        NSLayoutConstraint.activate([
            releaseDateInputField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            releaseDateInputField.centerYAnchor.constraint(equalTo: titleInputLabel.centerYAnchor, constant: 30)
        ])
    }
    
    @objc func addFilm() {
        print("add this film pls")
        
        let newTitle = titleInputLabel.text
        let newReleaseDate = Int(releaseDateInputField.text!)
        
        if let newTitle = newTitle, newTitle != "" {
            if let newReleaseDate = newReleaseDate {
                let newFilm = Film(title: newTitle, releaseDate: newReleaseDate, rating: .good)
                //films.append(newFilm)
                //self.isDismissed?()
                addFilmDelegate?.addFilmToList(film: newFilm)
                dismiss(animated: true)
            } else {
                print("no date entered")
            }
            
        } else {
            print("emptyu")
        }
    }
    
    deinit {
        print("new film view controller gone")
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
