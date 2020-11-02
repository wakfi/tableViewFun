//
//  Dog.swift
//  tableViewFun
//
//  Created by Gray, John Walker on 10/21/20.
//  Copyright © 2020 Walker Gray. All rights reserved.
//

import Foundation

// dog Icon made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>


//MARK:- Persistent Storage
/* 
local storage options
1.  UserDefaults: used for storing simple types in a dictionary
2.  Archiving:  ADS 4.7, reading and writing Codable objects from and to the file system
				inefficient for large files because you need to load/save entire file regardless of what you need to access
3.  SQLite database: light weight relational database that uses SQL
4.  Core Data: an Apple frame work that is an OOP wrapper for a data store, by default on iOS a SQLite database

remote options: 
backend as a service (BaaS) e.g. Firebase, Realm
host your own server
*/


//MARK:- Archiving 
/*
most standard types conform to the Codable protocol
plan:
1. get a url for a dogs.plist file that store dog array
2. write a static method to save the dogs array to dogs.plist
3. write a static method to load the dogs into array from dogs.plist
*/


class Dog: Codable
{
	var name: String
	var breed: String
	var imageName: String
	
	static let pListURL: URL = 
	{
		let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
		let fileURL = documentsDirectoryURL.appendingPathComponent("dogs").appendingPathExtension("plist")
		return fileURL
	}()
	
	static func saveDogsToFile(dogs: [Dog])
	{
		let encoder = PropertyListEncoder()
		if let dogsData = try? encoder.encode(dogs)
		{
			try? dogsData.write(to: pListURL)
		}
	}
	
	static func loadDogsFromFile() -> [Dog]?
	{
		let decoder = PropertyListDecoder()
		if let dogsData = try? Data(contentsOf: pListURL), let decodedDogs = try? decoder.decode([Dog].self, from: dogsData)
		{
			return decodedDogs
		}
		return nil
	}
	
	init(name: String, breed: String) 
	{
		self.name = name
		self.breed = breed
		self.imageName = "dog"
	}
}
