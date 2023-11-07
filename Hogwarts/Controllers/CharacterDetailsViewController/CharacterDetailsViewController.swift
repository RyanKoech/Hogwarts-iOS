//
//  CharacterDetailsViewController.swift
//  Hogwarts
//
//  Created by Ryan on 01/11/2023.
//

import UIKit
import SDWebImage

class CharacterDetailsViewController: UIViewController {
    
    private let TAG : String = String(describing: CharacterDetailsViewController.self)
    private var character : Character
    
    
    init (character : Character) {
        self.character = character
        super.init(nibName: TAG, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var characterAncestryLabel: UILabel!
    @IBOutlet weak var characterDobLabel: UILabel!
    @IBOutlet weak var characterWizardLabel: UILabel!
    @IBOutlet weak var characterAliveLabel: UILabel!
    @IBOutlet weak var characterSpeciesLabel: UILabel!
    @IBOutlet weak var characterGenderLabel: UILabel!
    @IBOutlet weak var characterNamrLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Character"
        characterImageView.sd_setImage(with: character.getURL(), placeholderImage: UIImage(named: "fallback"))
        characterNamrLabel.text = character.getName()
        characterGenderLabel.text = character.getGender()
        characterSpeciesLabel.text = character.getSpecies()
        characterAliveLabel.text = character.getAliveOrDead()
        characterWizardLabel.text = character.getIsWizardString()
        characterDobLabel.text = character.getDateOfBirth()
        characterAncestryLabel.text = character.getAncestry()
    }

}
