//
//  TennisMainViewController.swift
//  DesignApp
//
//  Created by Şükrü Özkoca on 16.01.2023.
//

import UIKit

class TennisMainViewController: UIViewController {

    private let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Clubs"
        label.font = UIFont(name: "GillSans-Bold", size: 35)
        label.textColor = .black
        return label
    }()
    
    private let secondTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Train"
        label.font = UIFont(name: "GillSans-Bold", size: 30)
        label.textColor = .black
        return label
    }()
    
    private let allesTrainLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Alles"
        label.font = UIFont(name: "GillSans-Bold", size: 17)
        label.textColor = .systemGreen
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let flowLayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        flowLayout.scrollDirection = .horizontal
        cv.collectionViewLayout = flowLayout
        cv.showsHorizontalScrollIndicator = false
        flowLayout.sectionInset.left = 20
        flowLayout.sectionInset.right = 20
        flowLayout.minimumLineSpacing = 20
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.register(UINib(nibName: "ClubsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ClubsCollectionViewCell")
        return cv
    }()
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UINib(nibName: "TrainTableViewCell", bundle: nil), forCellReuseIdentifier: "TrainTableViewCell")
        tableView.rowHeight = 50
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let cellSpacingHeight: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavBar()
        view.addSubview(titleLabel)
        titleLabelConstraint()
        view.addSubview(collectionView)
        collectionViewConstraint()
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(secondTitleLabel)
        secondTitleLabelConstraint()
    
        view.addSubview(allesTrainLabel)
        allesTrainLabelConstraint()
        
        view.addSubview(tableView)
        tableViewConstraint()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setNavBar() {
        let navBar = UINavigationBar(frame: CGRect(x: 10, y: 50, width: view.frame.width-20, height: 40))
        navBar.barTintColor = .white
        view.addSubview(navBar)
        navBar.tintColor = .black
        navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navBar.shadowImage = UIImage()
        let navItem = UINavigationItem()
        navItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease"), style: .plain, target: self, action: #selector(setMenu))
        navItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(setMenu))
        navBar.setItems([navItem], animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func setMenu() {}
    
    func titleLabelConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 15),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 120)
        ])
    }
    
    func secondTitleLabelConstraint() {
        NSLayoutConstraint.activate([
            secondTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 15),
            secondTitleLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor,constant: 30)
        ])
    }
    
    func collectionViewConstraint() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 40),
            collectionView.widthAnchor.constraint(equalToConstant: view.frame.width),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.height*0.4)
        ])
    }
    
    func tableViewConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: secondTitleLabel.bottomAnchor,constant: 20),
            tableView.widthAnchor.constraint(equalToConstant: view.frame.width),
            tableView.heightAnchor.constraint(equalToConstant: view.frame.height*0.25)
        ])
    }
    
    func allesTrainLabelConstraint() {
        NSLayoutConstraint.activate([
           // allesTrainLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor,constant: 30),
            allesTrainLabel.centerYAnchor.constraint(equalTo: secondTitleLabel.centerYAnchor),
            allesTrainLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20)
        ])
    }
}

extension TennisMainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ClubsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClubsCollectionViewCell", for: indexPath) as! ClubsCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width*0.7, height: view.frame.height*0.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension TennisMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TrainTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TrainTableViewCell", for: indexPath) as! TrainTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    

}
