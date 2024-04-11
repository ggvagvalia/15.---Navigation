//
//  secondVC.swift
//  15. დავალება - Navigation
//
//  Created by gvantsa gvagvalia on 4/11/24.
//

import UIKit

class secondVC: UIViewController {
    
    let selectedZodiacDetail: ZodiacDetailsModel?
    
    init(selectedZodiacDetail: ZodiacDetailsModel) {
        self.selectedZodiacDetail = selectedZodiacDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
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
    
    let signImage: UIImageView = {
        
        let myImage = UIImageView()
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.contentMode = .scaleAspectFit
        myImage.clipsToBounds = true
        return myImage
        
    }()
    
    let signName: UILabel = {
        
        let maName = UILabel()
        maName.text = ""
        maName.font = UIFont.systemFont(ofSize: 24)
        maName.textColor = .white
        maName.textAlignment = .center
        maName.translatesAutoresizingMaskIntoConstraints = false
        return maName
        
    }()
    
    let textView: UITextView = {
        
        let myView = UITextView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.text = ""
        myView.backgroundColor = .clear
        myView.textColor = .systemGray2
        myView.font = UIFont.systemFont(ofSize: 19)
        myView.isSelectable = false
        myView.isEditable = false
        myView.isScrollEnabled = true
        return myView
        
    }()
    
    let polaritiesButton: UIButton = {
        
        let myButton = UIButton()
        myButton.translatesAutoresizingMaskIntoConstraints = false
        //        ???
        myButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        myButton.setTitle("პოლარული ნიშანი", for: .normal)
        myButton.backgroundColor = .systemPurple
        myButton.layer.cornerRadius = 10
        return myButton
        
    }()
    
    @objc func didTapButton() {
        
        guard let polarSign = selectedZodiacDetail else { return }
        let vc = thirdVC(polarSignString: polarSign)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        addImage()
        addძZodiacImage()
        addTextView()
        addPolarButton()
        showZodiacInfo()
        
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
    
    func addძZodiacImage() {
        
        view.addSubview(signImage)
        view.addSubview(signName)
        
        NSLayoutConstraint.activate([
            signImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            signImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            signImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            signImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -600),
            
            signName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            signName.topAnchor.constraint(equalTo: signImage.bottomAnchor, constant: 30),
            signName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
        ])
        
    }
    
    func addTextView() {
        
        view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textView.topAnchor.constraint(equalTo: signName.topAnchor, constant: 60),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200)
        ])
        
    }
    
    func addPolarButton() {
        
        view.addSubview(polaritiesButton)
        
        NSLayoutConstraint.activate([
            polaritiesButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            polaritiesButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            polaritiesButton.heightAnchor.constraint(equalToConstant: 50),
            polaritiesButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
    }
    
    func showZodiacInfo() {
        
        if let sign = selectedZodiacDetail?.zodiacName {
            signName.text = sign
        } else {
            signName.text = "არალი"
        }
        if let description = selectedZodiacDetail?.zodiacDescription {
            textView.text = description
        } else {
            textView.text = "❌"
        }
        if let image = selectedZodiacDetail?.zodiacImage {
            signImage.image = UIImage(named: image)
        }
        textView.text = selectedZodiacDetail?.zodiacDescription
        
    }
    
}

//#Preview {
//    secondVC()
//}
