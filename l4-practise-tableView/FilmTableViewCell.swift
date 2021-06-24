//
//  FilmTableViewCell.swift
//  l4-practise-tableView
//
//  Created by Harriette Berndes on 22/06/2021.
//

import UIKit

class FilmTableViewCell: UITableViewCell {
    
    
    var titleLabel: UILabel!
    var releaseDateLabel: UILabel!
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "my")
        
        titleLabel = UILabel()
        //titleLabel.text = "hi"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        releaseDateLabel = UILabel()
        //releaseDateLabel.text = "2000"
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.textColor = .gray
        contentView.addSubview(releaseDateLabel)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        NSLayoutConstraint.activate([
            releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            releaseDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            releaseDateLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    func configure(film: Film) {
        titleLabel.text = film.title
        releaseDateLabel.text = "\(film.releaseDate)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
