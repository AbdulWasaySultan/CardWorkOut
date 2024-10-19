//
//  CardSelectionVC.swift
//  CardWorkOut
//
//  Created by ABDUR RAFAY on 05/10/2024.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    var cards : [UIImage] = Deck.allCards
    @IBOutlet var buttons: [UIButton]!
    
    
    var timer : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

            for button in buttons{
                button.layer.cornerRadius = 8
            }
        startTimer()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    @objc func showRandomImage(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        
        timer.invalidate()
    }
    
    @IBAction func restartButtonPressed(_ sender: UIButton) {
    
        timer.invalidate()
        startTimer()
    }
    
    @IBAction func rulesButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ToRulesVC", sender: self)
    }
}







