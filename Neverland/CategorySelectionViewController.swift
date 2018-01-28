//
//  CategorySelectionViewController.swift
//  Neverland
//
//  Created by Numeric on 1/27/18.
//  Copyright © 2018 League of Sophistication. All rights reserved.
//

import UIKit
import SpriteKit

class CategorySelectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var bubblesCollectionView: UICollectionView!
    @IBOutlet weak var sceneBubbleView: UIView!
    
    var name = ""
    var categories = ["Popular", "Avengers", "White House", "Downton Abbey", "Tech Leaders", "Phantom of the Opera"]
    var selectedCategory: Int = 0 {
        didSet {
            print("did change \(selectedCategory)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bubblesCollectionView.register(UINib(nibName:"BubbleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BubbleCollectionViewCell")
        self.categoryCollectionView.register(UINib(nibName:"CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")

        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.setCollectionViewLayout(CategoryLayout(), animated: true)
        setupBubblesView(withBubbleIndex: 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(changedToStar), name: NSNotification.Name(rawValue: "ChangedSelectionToNewStar"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(changedCategory), name: NSNotification.Name(rawValue: "ChangedSelectionForCategory"), object: nil)

    }
    
    @objc func changedCategory(notif: Notification) {
        Singleton.resetBubbles()
        if let index = notif.object as? Int {
            setupBubblesView(withBubbleIndex: index)
            selectedCategory = index
            
//            for i in 0..<categories.count {
//                if i != index {
//                    if let cell = categoryCollectionView.cellForItem(at: IndexPath(row: i, section: 0)) as? CategoryCollectionViewCell {
//                        cell.setUnactive()
//                    }
//                }
//
//            }
            
            if let cellArrays = (categoryCollectionView.visibleCells as? [CategoryCollectionViewCell]) {
                for cell in cellArrays {
                    if categoryCollectionView.indexPath(for: cell)?.row != index {
                        cell.setUnactive()
                    }
                }
            }
            

        }
    }
    
    @objc func changedToStar(notif: Notification) {
        if let starName = notif.object as? String {
            name = starName
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath)
        if let safecell = cell as? CategoryCollectionViewCell {
        safecell.categoryLabel.setTitle(categories[indexPath.row], for: .normal)
        safecell.isIndexOf = indexPath.row
        if (indexPath.row == selectedCategory) {
            safecell.setActive()
        } else {
            safecell.setUnactive()
        }
        safecell.delegate = self
//            if (indexPath.row == selectedCategory) {
//            } else {
//            }
        }
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        self.selectedCategory = indexPath.row
////        self.categoryCollectionView.reloadData()
//    }
    
    fileprivate var skView: SKView!
    fileprivate var floatingCollectionScene: BubblesScene!
    
    func setupBubblesView(withBubbleIndex: Int) {
        for subview: UIView in sceneBubbleView.subviews {
            subview.removeFromSuperview()
        }
        
        skView = SKView(frame: sceneBubbleView.bounds)
        skView.backgroundColor = SKColor.white
        sceneBubbleView.addSubview(skView)
        
        floatingCollectionScene = BubblesScene(size: skView.bounds.size)
//        let navBarHeight = navigationController!.navigationBar.frame.height
//        let statusBarHeight = UIApplication.shared.statusBarFrame.height
//        floatingCollectionScene.topOffset = 30
        skView.presentScene(floatingCollectionScene)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(commitSelection)
        )
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addBubble)
        )
        
        for _ in 0..<8 {
            addBubble(typeIndex: withBubbleIndex)
        }
    }
    
    @objc func addBubble(typeIndex: Int) {
        let newNode = BubbleNode.instantiate(typeIndex: typeIndex)
        floatingCollectionScene.addChild(newNode)
    }
    
    @objc func commitSelection() {
        floatingCollectionScene.performCommitSelectionAnimation()
    }

    @IBAction func nextTapped(_ sender: Any) {
        let roleVC = RoleSelectionViewController()
        roleVC.name = name
        roleVC.groupChatName = categories[selectedCategory]
        roleVC.groupChatIndex = selectedCategory
        self.present(roleVC, animated: true, completion: nil)
        
    }
}

class CategoryLayout: UICollectionViewFlowLayout, UICollectionViewDelegateFlowLayout {
    
    override init() {
        super.init()
        self.scrollDirection = .horizontal
        self.itemSize = CGSize(width: 120, height: 50)
        self.minimumLineSpacing = 5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 120, height: 50)
//    }
}
