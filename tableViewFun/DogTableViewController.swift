//
//  ViewController.swift
//  tableViewFun
//
//  Created by Gray, John Walker on 10/21/20.
//  Copyright © 2020 Walker Gray. All rights reserved.
//

import UIKit

class DogTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate 
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

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
	{
		// "how many rows should i put in this section"
		// we will only have 1 section
		return section == 0 ? dogs.count : 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
	{
		// "what cell should i put at this indexPath"
		let row = indexPath.row
		let dog = dogs[row]
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "DogCell", for: indexPath) as! DogTableViewCell
		cell.update(with: dog)
		return cell
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) 
	{
		if let identifier = segue.identifier
		{
			if identifier == "DetailSegue"
			{
				if let dogDetailVC = segue.destination as? DogDetailViewController
				{
					if let indexPath = tableView.indexPathForSelectedRow
					{
						let dog = dogs[indexPath.row]
						dogDetailVC.dogOptional = dog
					}
				}
			} else if identifier == "addSegue" {
				if let indexPath = tableView.indexPathForSelectedRow
				{
					tableView.deselectRow(at: indexPath, animated: false)
				}
			}
		}
	}
	
	@IBAction func unwindToDogTableViewController(segue: UIStoryboardSegue)
	{
		if let identifier = segue.identifier
		{
			if identifier == "saveUnwindSegue"
			{
				if let dogDetailVC = segue.source as? DogDetailViewController
				{
					if let dog = dogDetailVC.dogOptional
					{
						if let indexPath = tableView.indexPathForSelectedRow 
						{
							dogs[indexPath.row] = dog
							tableView.reloadData()
						} else {
							dogs.append(dog)
							tableView.reloadData()
						}
					}
				}
			}
		}
	}
}

