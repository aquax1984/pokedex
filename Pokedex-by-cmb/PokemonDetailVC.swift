//
//  PokemonDetailVC.swift
//  Pokedex-by-cmb
//
//  Created by Chris Bouquet on 1/10/16.
//  Copyright © 2016 Chris Bouquet. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    
    
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    var pokemon: Pokemon!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = UIImage(named: "\(pokemon.pokedexID)")
        nameLbl.text = pokemon.name
        mainImg.image = img
        currentEvoImg.image = img
        
        
        
        
        
        pokemon.downloadPokemonDetails { () -> () in
            //this will be called after download is done
            
            self.updateUI()
            
        }
    }
    
    func updateUI() {
        
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        pokedexLbl.text = "\(pokemon.pokedexID)"
        weightLbl.text = pokemon.weight
        baseAttackLbl.text = pokemon.attack
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
            
        }else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            
            if pokemon.nextEvolutionLvl != "" {
                str += " -LVL \(pokemon.nextEvolutionLvl)"
            }
        }
        
        
        
        
        
        
        
    }

    @IBAction func backButtonPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
        
    }

   
}
