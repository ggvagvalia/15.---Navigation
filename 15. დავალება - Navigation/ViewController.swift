//
//  ViewController.swift
//  15. დავალება - Navigation
//
//  Created by gvantsa gvagvalia on 4/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    var zodiacDetail: ZodiacDetailsModel?
    
    init(zodiacDetail: ZodiacDetailsModel? = nil) {
        self.zodiacDetail = zodiacDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "newBackground")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
        
    }()
    
    let stackView: UIStackView = {
        
        let myView = UIStackView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.axis = .vertical
        myView.distribution = .fillEqually
        myView.spacing = 10
        return myView
        
    }()
    
    let topView: UIView = {
        
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        return topView
        
    }()
    
    let hubNameLabel: UILabel = {
        
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "მიშა ცაგარელის ჰაბი"
        name.font = UIFont.systemFont(ofSize: 24)
        name.textColor = .white
        return name
        
    }()
    
    let infoAboutHubLabel: UILabel = {
        
        let infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები."
        infoLabel.font = UIFont.systemFont(ofSize: 17)
        infoLabel.textColor = .systemGray2
        infoLabel.numberOfLines = 0
        return infoLabel
        
    }()
    
    let bottomView: UIStackView = {
        
        let zodiacNameView = UIStackView()
        zodiacNameView.translatesAutoresizingMaskIntoConstraints = false
        zodiacNameView.axis = .vertical
        zodiacNameView.distribution = .fillProportionally
        zodiacNameView.spacing = 10
        return zodiacNameView
        
    }()
    
    let enterZodiacSignTextField: UITextField = {
        let enterZidiacSign = UITextField()
        enterZidiacSign.translatesAutoresizingMaskIntoConstraints = false
        enterZidiacSign.attributedPlaceholder = NSAttributedString(string: "მაგ: ლომი", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray3])
        enterZidiacSign.font = UIFont.systemFont(ofSize: 15)
        enterZidiacSign.borderStyle = .roundedRect
        enterZidiacSign.backgroundColor = .clear
        enterZidiacSign.layer.borderColor = UIColor.white.cgColor
        enterZidiacSign.layer.borderWidth = 1
        enterZidiacSign.textColor = .white
        return enterZidiacSign
    }()
    
    private let goToZodiacDetailButton: UIButton = {
        
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("შემდეგ", for: .normal)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 10
        return button
        
    }()
    
    @objc func didTapButton() {
        guard let zodiacSign = enterZodiacSignTextField.text else { return }
        if let zodiacDetail = zodiacInfoArray.first(where: { $0.zodiacName == zodiacSign }) {
            let vc = secondVC(selectedZodiacDetail: zodiacDetail)
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            print("no zodiac")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addImage()
        addStackView()
        addtopView()
        addMiddleView()
    }
    
    func addImage() {
        
        view.addSubview(imageView)
        view.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
    func addStackView() {
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 18),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }
    
    func addtopView() {
        
        stackView.addArrangedSubview(topView)
        topView.addSubview(hubNameLabel)
        topView.addSubview(infoAboutHubLabel)
        
        NSLayoutConstraint.activate([
            topView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            topView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            
            hubNameLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 0),
            hubNameLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 0),
            hubNameLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0),
            hubNameLabel.bottomAnchor.constraint(equalTo: infoAboutHubLabel.topAnchor, constant: -10),
            hubNameLabel.heightAnchor.constraint(equalTo: infoAboutHubLabel.heightAnchor, multiplier: 0.5),
            
            infoAboutHubLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            infoAboutHubLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            infoAboutHubLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0)
        ])
        
    }
    
    func addMiddleView() {
        
        let enterZodiacSignLabel = UILabel()
        enterZodiacSignLabel.translatesAutoresizingMaskIntoConstraints = false
        enterZodiacSignLabel.textColor = .white
        enterZodiacSignLabel.text = "ზოდიაქოს სახელი"
        
        stackView.addArrangedSubview(bottomView)
        bottomView.addArrangedSubview(enterZodiacSignLabel)
        bottomView.addArrangedSubview(enterZodiacSignTextField)
        bottomView.addArrangedSubview(goToZodiacDetailButton)
        
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            bottomView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            bottomView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.35),
            
            enterZodiacSignLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 0),
            enterZodiacSignLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 0),
            enterZodiacSignLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: 0),
            enterZodiacSignLabel.heightAnchor.constraint(equalTo: enterZodiacSignTextField.heightAnchor, multiplier: 0.5),
            
            enterZodiacSignTextField.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 0),
            enterZodiacSignTextField.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: 0),
            
            goToZodiacDetailButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 0),
            goToZodiacDetailButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: 0),
            goToZodiacDetailButton.heightAnchor.constraint(equalTo: enterZodiacSignTextField.heightAnchor)
        ])
        
    }
    
}
//
//#Preview {
//    ViewController()
//}
