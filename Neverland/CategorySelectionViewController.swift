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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bubblesCollectionView.register(UINib(nibName:"BubbleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BubbleCollectionViewCell")
        self.categoryCollectionView.register(UINib(nibName:"CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")

        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self

        setupBubblesView()

    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 80, height: 44);
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == categoryCollectionView) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath)
            return cell
            
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BubbleCollectionViewCell", for: indexPath)
        cell.layer.backgroundColor = UIColor.red.cgColor
        
        return cell
    }
    
    fileprivate var skView: SKView!
    fileprivate var floatingCollectionScene: BubblesScene!
    
    func setupBubblesView() {
        skView = SKView(frame: sceneBubbleView.frame)
        skView.backgroundColor = SKColor.white
        view.addSubview(skView)
        
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
        
        for _ in 0..<20 {
            addBubble()
        }
    }
    
    @objc func addBubble() {
        let newNode = BubbleNode.instantiate()
        floatingCollectionScene.addChild(newNode)
    }
    
    @objc func commitSelection() {
        floatingCollectionScene.performCommitSelectionAnimation()
    }

}

