//
//  CountrySelectorViewController.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 22/09/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class CountrySelectorViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        tableView.dataSource = self
        tableView.delegate = self
        
        //TODO
        //1 - Get the json list
        //2 - Show the country names
        //3 - When clicked, need to go to the other viewController with the country name
        //(The other controller will get all the cities and when the user select it, will get lat/long
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //todo
        let cell = UITableViewCell()
        cell.textLabel?.text = "TODO"
        
        return cell
    }
}
