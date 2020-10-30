//
//  Dog.swift
//  tableViewFun
//
//  Created by Gray, John Walker on 10/21/20.
//  Copyright © 2020 Walker Gray. All rights reserved.
//

import Foundation

// dog Icon made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>

class Dog
{
	var name: String
	var breed: String
	var imageName: String
	
	init(name: String, breed: String) 
	{
		self.name = name
		self.breed = breed
		self.imageName = "dog"
	}
}
