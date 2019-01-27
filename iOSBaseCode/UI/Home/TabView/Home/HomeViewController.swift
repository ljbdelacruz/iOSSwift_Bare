//
//  HomeViewController.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 27/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var presenter: HomeViewPresenter!
    var shows:[Shows]=[];
    @IBOutlet weak var UIShowSB: UISearchBar!
    @IBOutlet weak var UIShowListTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.UIShowListTV.delegate=self;
        self.UIShowListTV.dataSource=self;
        self.UIShowSB.delegate=self;
        self.UIShowListTV.register(UITableViewCell.self, forCellReuseIdentifier: "showsCell");
        self.presenter.loadByTitle(title: "Boruto");
        presenter.attachView(view: self);
    }
}

extension HomeViewController : HomeView{
    func showShowsSuccess(shows: [Shows]) {
        self.shows=[];
        shows.forEach({ item in
            self.shows.append(item);
        })
        self.UIShowListTV.reloadData();
    }
}
//MARK: TableViewDelegate

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=self.UIShowListTV.dequeueReusableCell(withIdentifier: "showsCell", for: indexPath) as! UITableViewCell;
        print(self.shows[indexPath.row].title);
        cell.textLabel?.text=self.shows[indexPath.row].title;
        return cell;
    }
}

extension HomeViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Searching");
        self.presenter.loadByTitle(title: searchBar.text!);
    }
}
