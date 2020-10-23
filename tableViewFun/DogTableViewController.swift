//
//  ViewController.swift
//  tableViewFun
//
//  Created by Gray, John Walker on 10/21/20.
//  Copyright © 2020 Walker Gray. All rights reserved.
//

import UIKit

class DogTableViewController: UIViewController 
{
	
	var dogs: [Dog] = []
	@IBOutlet var tableView: UITableView!
	
	override func viewDidLoad() 
	{
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		dogs.append(Dog(name: "Lassie", breed: "Collie"))
		dogs.append(Dog(name: "AirBud", breed: "Retriever"))
		dogs.append(Dog(name: "Spike", breed: "Bulldog"))
	}


}

