//
//  DogDetailViewController.swift
//  tableViewFun
//
//  Created by Gray, John Walker on 10/28/20.
//  Copyright © 2020 Walker Gray. All rights reserved.
//

import UIKit

class DogDetailViewController: UIViewController {
	
	var dogOptional: Dog?

	@IBOutlet var nameTextField: UITextField!
	@IBOutlet var breedTextField: UITextField!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		if let dog = dogOptional
		{
			nameTextField.text = dog.name
			breedTextField.text = dog.breed
		}
        // Do any additional setup after loading the view.
    }
	
	
    
    //MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
		if let identifier = segue.identifier
		{
			if identifier == "saveUnwindSegue" || identifier == "newSaveUnwindSegue"
			{
				if let name = nameTextField.text, let breed = breedTextField.text
				{
					if let dog = dogOptional
					{
						dog.name = name
						dog.breed = breed
					} else {
						dogOptional = Dog(name: name, breed: breed)
					}
				}
			}
		}
    }
    

}
