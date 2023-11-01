//
//  CharacterCollectionViewCell.swift
//  Hogwarts
//
//  Created by Ryan on 31/10/2023.
//

import UIKit
import SDWebImage

class CharacterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    
    public static let indentifier : String = "CharacterCollectionViewCell"
    
    public static func registerCell() -> UINib {
        return UINib(nibName: CharacterCollectionViewCell.indentifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCell(name : String, imageUrl : URL?) {
        self.characterImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "fallback"))
        self.characterNameLabel.text = name
    }
}
