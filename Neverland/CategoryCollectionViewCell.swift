//
//  CategoryCollectionViewCell.swift
//  Neverland
//
//  Created by Numeric on 1/27/18.
//  Copyright © 2018 League of Sophistication. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryLabel: UIButton!
    @IBOutlet weak var selectionView: UIView!
    var isActive = false
    var isIndexOf: Int = 0
    var delegate: CategorySelectionViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        if (isActive == false) {
            setActive()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ChangedSelectionForCategory"), object: self.isIndexOf, userInfo: nil)

        } else {
            setUnactive()
        }
    }
    
    func setActive() {
        self.categoryLabel.setTitleColor(UIColor.white, for: .normal)
        self.selectionView.backgroundColor = UIColor.init(red: 55/255.0, green: 151/255.0, blue: 247/255.0, alpha: 1)
        isActive = true
        self.delegate?.selectedCategory = self.isIndexOf
    }
    
    func setUnactive() {
        self.categoryLabel.setTitleColor(UIColor.white, for: .normal)
        self.selectionView.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        isActive = false
    }
    
    func switchBetweenActiveAndInactive() {
        
    }
    
}
