//
//  CharacterDetailsViewController.swift
//  Hogwarts
//
//  Created by Ryan on 01/11/2023.
//

import UIKit

class CharacterDetailsViewController: UIViewController {

    @IBOutlet weak var characterNamrLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Character"
        characterImageView.image = UIImage(named: "fallback")
        characterNamrLabel.text = "Unknown"
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
