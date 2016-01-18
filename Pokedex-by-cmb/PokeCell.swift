//
//  PokeCell.swift
//  Pokedex-by-cmb
//
//  Created by Chris Bouquet on 1/9/16.
//  Copyright © 2016 Chris Bouquet. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    //what do we want in this cell??
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
        
    }
    
    
    func configureCell(pokemon: Pokemon) {
        
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexID)")
    }
    
}
