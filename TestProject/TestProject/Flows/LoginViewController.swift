//
//  ViewController.swift
//  TestProject
//
//  Created by Евгений Васильев on 01.10.2022.
//

import UIKit

final class LoginViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let titleText = "Test zenit project"
        static let imageAssets = "LoginIcon"
        static let loginText = "Login"
        static let passwordText = "Password"
        static let titleFont: CGFloat = 25
        static let confirmButtonFont: CGFloat = 18
        static let errorFont: CGFloat = 16
        static let cornerRadius: CGFloat = 10
        static let numberOfLines = 0
        static let login = "admin"
        static let password = "12345"
        static let errorText = "Wrong login or password"
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var icon: UIImageView!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmButton: UIButton!
    @IBOutlet private weak var errorLabel: UILabel!
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitle()
        configureIcon()
        configureLoginField()
        configurePasswordField()
        configureConfirmButton()
        configureErrorlabel()
    }

    @IBAction func loginButtonAction(_ sender: Any) {
        validate()
    }
    

}

// MARK: - Configuration

private extension LoginViewController {

    func configureTitle() {
        titleLabel.text = Constants.titleText
        titleLabel.font = .systemFont(
            ofSize: Constants.titleFont,
            weight: .heavy
        )
        titleLabel.textColor = .systemMint
        titleLabel.numberOfLines = Constants.numberOfLines
    }

    func configureIcon() {
        icon.image = UIImage(named: Constants.imageAssets)
    }

    func configureLoginField() {
        loginTextField.backgroundColor = .clear
        loginTextField.tintColor = .systemMint
        loginTextField.textColor = .black
        loginTextField.attributedPlaceholder = NSAttributedString(
            string: Constants.loginText,
            attributes: [.foregroundColor: UIColor.lightGray]
        )
        loginTextField.borderStyle = .roundedRect
        loginTextField.layer.cornerRadius = Constants.cornerRadius
        loginTextField.textAlignment = .left
    }

    func configurePasswordField() {
        passwordTextField.backgroundColor = .clear
        passwordTextField.tintColor = .systemMint
        passwordTextField.textColor = .black
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: Constants.passwordText,
            attributes: [.foregroundColor: UIColor.lightGray]
        )
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.cornerRadius = Constants.cornerRadius
        passwordTextField.textAlignment = .left
    }

    func configureConfirmButton() {
        confirmButton.layer.cornerRadius = Constants.cornerRadius
        confirmButton.titleLabel?.text = Constants.loginText
        confirmButton.titleLabel?.font = .systemFont(
            ofSize: Constants.confirmButtonFont,
            weight: .regular
        )
        confirmButton.titleLabel?.textColor = .white
        confirmButton.backgroundColor = .systemMint
    }

    func configureErrorlabel() {
        errorLabel.text = Constants.errorText
        errorLabel.font = .systemFont(ofSize: Constants.errorFont, weight: .regular)
        errorLabel.textColor = .red
        errorLabel.isHidden = true
    }

}

// MARK: - Private Methods

private extension LoginViewController {

    func validate() {
        let loginText = loginTextField.text
        let passwordText = passwordTextField.text
        let validate = (loginText == Constants.login) && (passwordText == Constants.password)
        let viewController = MainScreenTableViewController()
        errorLabel.isHidden = validate
        
        guard validate else {
            return
        }
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
}
