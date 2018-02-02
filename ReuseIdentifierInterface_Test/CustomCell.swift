//
//  CustomCell.swift
//  ReuseIdentifierInterface_Test
//
//  Created by Andres Felipe Ocampo Eljaiesk on 2/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell, ReuseIdentifierInterface {
    
    //MARK: - IBOutlets
    @IBOutlet weak var myAceptarButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
}
