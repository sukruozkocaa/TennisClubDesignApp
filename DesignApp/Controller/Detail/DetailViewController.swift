//
//  DetailViewController.swift
//  DesignApp
//
//  Created by Şükrü Özkoca on 18.01.2023.
//

import UIKit

class DetailViewController: UIViewController {

    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "tennismanplayer")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let openDetailView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 35
        view.frame = CGRect(x: 0,  y: Constanst.shared.screenSize.height, width: Constanst.shared.screenSize.width, height: 0)
        return view
    }()
    
    private let detailLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Men's league"
        label.textColor = .white
        label.font = UIFont(name: "GillSans-Bold", size: 30)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Take part in a 2-hour session where you can except plenty of rallying followed by competitive point play team singles style."
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    
    //MARK: - DateView
    private let dateView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.borderWidth = 0.2
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    private let dateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "calendar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        return imageView
    }()
    
    private let dateLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "24 February"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray5
        return label
    }()
    
    //MARK: - ClockView
    private let clockView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.borderWidth = 0.2
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    private let clockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "clock")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        return imageView
    }()
    
    private let clockLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "18:00 - 20:00"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray4
        return label
    }()
    
    //MARK: - LevelView
    private let levelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.borderWidth = 0.2
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    private let levelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let levelLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "All levels"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray4
        return label
    }()
    
    private let buyButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Participate $30", for: .normal)
        button.backgroundColor = UIColor(red: 3/255, green: 106/255, blue: 65/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let backButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("", for: .normal)
        button.backgroundColor = .white
        button.tintColor = .black
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(backView), for: .touchDown)
        return button
    }()
    
    var viewSize: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSize = view.frame.size.width - 70
        
        view.addSubview(imageView)
        imageViewConstraint()
        
        view.addSubview(backButton)
        backButtonConstraint()
        
        openDetailView.addSubview(detailLabel)
        detailLabelConstraint()
        openDetailView.addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 20, y: 100, width: view.frame.width-40, height: 100)
        
        
        //DateView
        openDetailView.addSubview(dateView)
        dateViewConstraint()
        
        dateView.addSubview(dateImageView)
        dateView.addSubview(dateLabel)
        dateImageViewConstraint()
        
        //ClockView
        openDetailView.addSubview(clockView)
        clockViewConstraint()
        
        clockView.addSubview(clockImageView)
        clockView.addSubview(clockLabel)
        clockImageViewConstraint()
        //LevelView
        openDetailView.addSubview(levelView)
        levelViewConstraint()

        levelView.addSubview(levelImageView)
        levelView.addSubview(levelLabel)
        levelImageViewConstraint()
        
        view.addSubview(openDetailView)
        
        openDetailView.addSubview(buyButton)
        buyButtonConstraint()
        
        UIView.animate(withDuration: 1) {
            self.openDetailView.frame = CGRect(x: 0, y: self.view.frame.height/2, width: self.view.frame.width, height: self.view.frame.height/2)
        }
    }
    
    @objc func backView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func backButtonConstraint() {
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 50),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.topAnchor.constraint(equalTo: view.topAnchor,constant: view.frame.height*0.07),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20)
        ])
    }
    
    func imageViewConstraint() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: view.frame.width),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.height)
        ])
    }
    
    func detailLabelConstraint() {
        NSLayoutConstraint.activate([
            detailLabel.topAnchor.constraint(equalTo: openDetailView.topAnchor,constant: 50),
            detailLabel.leftAnchor.constraint(equalTo: openDetailView.leftAnchor,constant: 25)
        ])
    }

    func titleLabelConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor,constant: 20),
            titleLabel.leftAnchor.constraint(equalTo: openDetailView.leftAnchor,constant: 25)
        ])
    }
    
    func dateViewConstraint() {
        NSLayoutConstraint.activate([
            dateView.widthAnchor.constraint(equalToConstant: viewSize!/3),
            dateView.heightAnchor.constraint(equalToConstant: viewSize!/3 - 10),
            dateView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 30),
            dateView.leftAnchor.constraint(equalTo: openDetailView.leftAnchor,constant: 20)
        ])
    }
    
    func clockViewConstraint() {
        NSLayoutConstraint.activate([
            clockView.widthAnchor.constraint(equalToConstant: viewSize!/3),
            clockView.heightAnchor.constraint(equalToConstant: viewSize!/3 - 10),
            clockView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 30),
            clockView.leftAnchor.constraint(equalTo: dateView.rightAnchor,constant: 15)
        ])
    }
    
    func levelViewConstraint() {
        NSLayoutConstraint.activate([
            levelView.widthAnchor.constraint(equalToConstant: viewSize!/3),
            levelView.heightAnchor.constraint(equalToConstant: viewSize!/3 - 10),
            levelView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 30),
            levelView.leftAnchor.constraint(equalTo: clockView.rightAnchor,constant: 15)
        ])
    }
    
    func dateImageViewConstraint() {
        NSLayoutConstraint.activate([
            dateImageView.widthAnchor.constraint(equalToConstant: (viewSize!/3)/3),
            dateImageView.heightAnchor.constraint(equalToConstant:(viewSize!/3)/3),
            dateImageView.topAnchor.constraint(equalTo: dateView.topAnchor,constant: 20),
            dateImageView.centerXAnchor.constraint(equalTo: dateView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: dateImageView.bottomAnchor,constant: 10),
            dateLabel.centerXAnchor.constraint(equalTo: dateView.centerXAnchor)
        ])
    }
    
    
    func clockImageViewConstraint() {
        NSLayoutConstraint.activate([
            clockImageView.widthAnchor.constraint(equalToConstant: (viewSize!/3)/3),
            clockImageView.heightAnchor.constraint(equalToConstant:(viewSize!/3)/3),
            clockImageView.topAnchor.constraint(equalTo: clockView.topAnchor,constant: 20),
            clockImageView.centerXAnchor.constraint(equalTo: clockView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            clockLabel.topAnchor.constraint(equalTo: clockImageView.bottomAnchor,constant: 10),
            clockLabel.centerXAnchor.constraint(equalTo: clockView.centerXAnchor)
        ])
    }
    
    func levelImageViewConstraint() {
        NSLayoutConstraint.activate([
            levelImageView.widthAnchor.constraint(equalToConstant: (viewSize!/3)/3),
            levelImageView.heightAnchor.constraint(equalToConstant:(viewSize!/3)/3),
            levelImageView.topAnchor.constraint(equalTo: levelView.topAnchor,constant: 20),
            levelImageView.centerXAnchor.constraint(equalTo: levelView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            levelLabel.topAnchor.constraint(equalTo: levelImageView.bottomAnchor,constant: 10),
            levelLabel.centerXAnchor.constraint(equalTo: levelView.centerXAnchor)
        ])
    }
    
    func buyButtonConstraint() {
        NSLayoutConstraint.activate([
            buyButton.widthAnchor.constraint(equalToConstant: view.frame.width - 50),
            buyButton.heightAnchor.constraint(equalToConstant: 50),
            buyButton.centerXAnchor.constraint(equalTo: openDetailView.centerXAnchor),
            buyButton.topAnchor.constraint(equalTo: dateView.bottomAnchor,constant: 30)
        ])
    }
}
