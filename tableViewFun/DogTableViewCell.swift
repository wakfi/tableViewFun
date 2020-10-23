//
//  DogTableViewCell.swift
//  tableViewFun
//
//  Created by Gray, John Walker on 10/23/20.
//  Copyright © 2020 Walker Gray. All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell 
{

	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var breedLabel: UILabel!
	
	override func awakeFromNib() 
	{
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) 
	{
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	func update(with dog: Dog)
	{
		nameLabel.text = dog.name
		breedLabel.text = dog.breed
	}
	
	
}
