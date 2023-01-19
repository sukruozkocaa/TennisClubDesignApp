//
//  ViewController.swift
//  DesignApp
//
//  Created by Şükrü Özkoca on 15.01.2023.
//

import UIKit

class ViewController: UIViewController {

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let flowLayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        flowLayout.scrollDirection = .horizontal
        cv.collectionViewLayout = flowLayout
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CardCollectionViewCell")
        return cv
    }()
    
    private let nextButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let configure = UIImage.SymbolConfiguration(pointSize: 30)
        button.setImage(UIImage(systemName: "greaterthan.circle",withConfiguration: configure), for: .normal)
        button.backgroundColor = UIColor(red: 8/255, green: 106/255, blue: 65/255, alpha: 1)
        button.tintColor = .white
        button.addTarget(self, action: #selector(goToTennisMain), for: .touchDown)
        return button
    }()
    
    private let homeLabel: UILabel = {
       let label = UILabel()
        label.text = "Choose your level"
        label.textColor = .white
        label.font = UIFont(name: "GillSans-Bold", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let skipLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Skip for now"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(nextButton)
        view.addSubview(homeLabel)
        view.addSubview(skipLabel)
        nextButtonConstraint()
        nextButton.layer.masksToBounds = false
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = (view.frame.width*0.2)/2
        view.addSubview(collectionView)
        collectionViewConstraint()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @objc func goToTennisMain(){
        let vc = TennisMainViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    func nextButtonConstraint() {
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: view.frame.width*0.2),
            nextButton.heightAnchor.constraint(equalToConstant: view.frame.width*0.2),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            homeLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: view.frame.height*0.15),
            homeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            skipLabel.topAnchor.constraint(equalTo: nextButton.bottomAnchor,constant: 20),
            skipLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func collectionViewConstraint() {
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalToConstant: view.frame.width),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.height*0.6),
            collectionView.topAnchor.constraint(equalTo: homeLabel.bottomAnchor,constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: nextButton.topAnchor,constant: 0)
        ])
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CardCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width*0.75, height: view.frame.height*0.45)
    }
}
