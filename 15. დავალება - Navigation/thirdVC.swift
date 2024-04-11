//
//  thirdVC.swift
//  15. დავალება - Navigation
//
//  Created by gvantsa gvagvalia on 4/11/24.
//

import UIKit

class thirdVC: UIViewController {
    
    let polarSignString: ZodiacDetailsModel
    
    init(polarSignString: ZodiacDetailsModel) {
        self.polarSignString = polarSignString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let image: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "newBackground")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
        
    }()
    
    let polarSignImage: UIImageView = {
        
        let name = UIImageView()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.contentMode = .scaleToFill
        return name
        
    }()
    
    let polarSignLabel: UILabel = {
        
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .white
        name.text = ""
        name.font = UIFont.systemFont(ofSize: 24)
        name.textAlignment = .center
        return name
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        addPolarLabel()
        addPolars()
        
    }
    
    func addPolars() {
        
        if let polarSign = polarSignString.polarSign {
            polarSignLabel.text = polarSign
            polarSignImage.image = UIImage(named: polarSign)
        }
        
    }
    
    func addPolarLabel() {
        
        view.backgroundColor = .black
        view.addSubview(image)
        view.addSubview(polarSignImage)
        view.addSubview(polarSignLabel)
        
        NSLayoutConstraint.activate([
            polarSignImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            polarSignImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            polarSignImage.heightAnchor.constraint(equalToConstant: 200),
            polarSignImage.widthAnchor.constraint(equalToConstant: 200),
            
            polarSignLabel.topAnchor.constraint(equalTo: polarSignImage.bottomAnchor, constant: 20),
            polarSignLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
}
