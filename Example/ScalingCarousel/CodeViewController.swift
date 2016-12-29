//
//  CodeViewController.swift
//  ScalingCarousel
//
//  Created by Pete Smith on 29/12/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import ScalingCarousel

class CodeCell: ScalingCarouselCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        mainView = UIView(frame: contentView.bounds)
        contentView.addSubview(mainView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CodeViewController: UIViewController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addCarousel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Configuration
    
    private func addCarousel() {
        
        let frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        let scalingCarousel = ScalingCarouselView(withFrame: frame, andInset: 20)
        scalingCarousel.dataSource = self
        scalingCarousel.translatesAutoresizingMaskIntoConstraints = false
        scalingCarousel.backgroundColor = .white
        
        scalingCarousel.register(CodeCell.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(scalingCarousel)
        
        // Constraints
        scalingCarousel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        scalingCarousel.heightAnchor.constraint(equalToConstant: 300).isActive = true
        scalingCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scalingCarousel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
    }
}

extension CodeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if let scalingCell = cell as? ScalingCarouselCell {
            scalingCell.mainView.backgroundColor = .blue
        }
        
        return cell
    }
}