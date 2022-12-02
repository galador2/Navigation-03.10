//
//  LogInViewController.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 28.11.2022.
//

import UIKit

class LogInViewController: UIViewController{
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
        
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
        
    }()
    
     private lazy var login:UITextField = {
        let login = UITextField()
        login.borderStyle = .roundedRect
        login.placeholder = "Email or phone"
        login.tag = 0
        login.clearButtonMode = .whileEditing
        login.delegate = self
        login.textColor = .gray
        login.backgroundColor = .systemGray6
        login.translatesAutoresizingMaskIntoConstraints = false
        return login
        
    }()
    
    private lazy var password: UITextField = {
        let password = UITextField()
        password.borderStyle = .roundedRect
        password.tag = 1
        password.placeholder = "Password"
        password.textColor = .gray
        password.isSecureTextEntry = true
        password.delegate = self
        password.backgroundColor = .systemGray6
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
        
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = getUIColor(hex: "#4885CC")
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("Log in", for: .normal)
        button.addTarget(self, action: #selector(setupButtonLogIn), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    private lazy var pictureVK: UIImageView = {
        var pictureVK = UIImageView()
        let fotoPictureVK = UIImage(named: "logo")
        pictureVK = UIImageView(image: fotoPictureVK)
        pictureVK.contentMode = .scaleAspectFill
        pictureVK.clipsToBounds = true
        pictureVK.layer.cornerRadius = 23
        pictureVK.translatesAutoresizingMaskIntoConstraints = false
        return pictureVK
        
    }()
    private var log: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(self.hideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    
    }
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(stackView)
        self.stackView.addArrangedSubview(login)
        self.stackView.addArrangedSubview(password)
        self.stackView.addArrangedSubview(button)
        self.view.addSubview(pictureVK)
        viewConstrain()
        setupGestures()
        stackView.setCustomSpacing(16, after: password)
    }
    
    private func setupGestures(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    private func getUIColor(hex: String, alpha: Double = 1.0) -> UIColor? {
        var cleanString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cleanString.hasPrefix("#")) {
            cleanString.remove(at: cleanString.startIndex)
        }

        if ((cleanString.count) != 6) {
            return nil
        }

        var rgbValue: UInt32 = 0
        Scanner(string: cleanString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    private func viewConstrain(){
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
           
            self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.stackView.heightAnchor.constraint(equalToConstant: 150),
            self.stackView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor, constant: 20),
            self.stackView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor, constant: 30),
            
          
            self.pictureVK.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
            self.pictureVK.widthAnchor.constraint(equalToConstant: 100),
            self.pictureVK.heightAnchor.constraint(equalToConstant: 100),
            self.pictureVK.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),

        ])
    }
    
    @objc private func setupLoginPassword(){
        login.text = ""
        password.text = ""
    }
    
    @objc private func setupButtonLogIn(){
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    @objc private func keyboard(_ notification: Notification){
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?
            NSValue{
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height

            let loginButtonBottomPointY = self.stackView.frame.origin.y + self.button.frame.origin.y + self.button.frame.height

            let keyboardOriginY = self.view.frame.height - keyboardHeight

           // let yOffset = keyboardOriginY < loginButtonBottomPointY
            let yOffset = loginButtonBottomPointY < keyboardOriginY
            ? loginButtonBottomPointY - keyboardOriginY + 20
            : 0


           self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)

        }
        
    }
    
    @objc private func hideKeyboard(_ notification: Notification){
        self.forcedHidingKeyboard()
      
    }
    
    @objc private func forcedHidingKeyboard(){
        self.view.endEditing(true)
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        
    }
    
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print(" \(textField.text)")
        if textField.tag == 0 {
            self.log = textField.text
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.forcedHidingKeyboard()
        return true
    }
}

