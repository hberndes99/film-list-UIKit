//
//  DetailFilmViewController.swift
//  l4-practise-tableView
//
//  Created by Harriette Berndes on 22/06/2021.
//

import UIKit

class DetailFilmViewController: UIViewController {
    
    var titleLabel: UILabel!
    var releaseDateLabel: UILabel!
    var ratingLabel: UILabel!
    var selectedFilm: Film
    
    init(selectedFilm: Film) {
        self.selectedFilm = selectedFilm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = selectedFilm.title
        view.addSubview(titleLabel)
        
        releaseDateLabel = UILabel()
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.text = "\(selectedFilm.releaseDate)"
        view.addSubview(releaseDateLabel)
        
        ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.text = "Rating: \(selectedFilm.rating)"
        view.addSubview(ratingLabel)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            releaseDateLabel.centerYAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            releaseDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            ratingLabel.centerYAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 30),
            ratingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
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
