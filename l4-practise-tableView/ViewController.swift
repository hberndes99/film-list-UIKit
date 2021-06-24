//
//  ViewController.swift
//  l4-practise-tableView
//
//  Created by Harriette Berndes on 22/06/2021.
//

import UIKit

var films = [
    Film(title: "The Parent Trap", releaseDate: 1998, rating: .great),
    Film(title: "Wild Child", releaseDate: 2008, rating: .great),
    Film(title: "Twilight", releaseDate: 2008, rating: .average),
    Film(title: "Clueless", releaseDate: 1995, rating: .good),
    Film(title: "Easy A", releaseDate: 2010, rating: .great),
    Film(title: "La la land", releaseDate: 2016, rating: .good)
]

class ViewController: UIViewController {
    
    var tableView: UITableView!
    var cellHeight: CGFloat = 55
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Film List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        
        // table view
        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FilmTableViewCell.self, forCellReuseIdentifier: "my")
        view.addSubview(tableView)
    }
    
    @objc func addTapped() {
        let newFilmViewController = NewFilmViewController()
        present(newFilmViewController, animated: true)
        newFilmViewController.isDismissed = {
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "my", for: indexPath) as! FilmTableViewCell
        cell.configure(film: films[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedFilm = films[indexPath.row]
        let detailFilmViewController = DetailFilmViewController(selectedFilm: selectedFilm)
        navigationController?.pushViewController(detailFilmViewController, animated: true)
        //present(detailFilmViewController, animated: true)
        
    }
    
    
    // to implement the swipe to delete action
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = deleteFilm(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func deleteFilm (at: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") {(action, view, completion) in
            films.remove(at: at.row)
            self.tableView.reloadData()
            completion(true)
        }
        return action
    }
}
