//
//  ViewController.swift
//  00TestProj
//
//  Created by Александр Фофонов on 26.01.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(containerView)
        containerView.addSubview(titleLable)
        containerView.addSubview(phoneTextField)
        containerView.addSubview(loginButton)
    }
    
    enum Constants {

        static let paddingX: CGFloat = 16
        static let paddingY: CGFloat = 64
        static let space: CGFloat = 20
        static let UIComponentHeight: CGFloat = 50
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let containerWidth = view.bounds.width - 2 * Constants.paddingX
        let containerHeightWithouTitleLabel = 2 * Constants.UIComponentHeight + 2 * Constants.space + 2 * Constants.paddingY
        
        let labelWidth = containerWidth - 2 * Constants.paddingX
        let labelHeight = containerView.bounds.height - containerHeightWithouTitleLabel
        let labelSize = titleLable.sizeThatFits(.init(width: labelWidth, height: labelHeight))
        
        let containerHeight = labelSize.height + containerHeightWithouTitleLabel
        
        containerView.frame = .init(
            x: 0,
            y: 0,
            width: containerWidth,
            height: containerHeight
        )
        
        containerView.center = view.center

        titleLable.frame = .init(
            x: Constants.paddingX,
            y: Constants.paddingY,
            width: labelWidth,
            height: labelSize.height
        )

        phoneTextField.frame = .init(
            x: Constants.paddingX,
            y: titleLable.frame.maxY + Constants.space,
            width: labelWidth,
            height: Constants.UIComponentHeight
        )

        loginButton.frame = .init(
            x: Constants.paddingX,
            y: phoneTextField.frame.maxY + Constants.space,
            width: labelWidth,
            height: Constants.UIComponentHeight
        )
        
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.clipsToBounds = true
        return view
    }()

    lazy var titleLable: UILabel = {
        let label = UILabel()
        label.backgroundColor = .orange
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 16
        label.text = "Добро пожаловать,\nСтранник!"
//        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce scelerisque at felis a aliquet. Phasellus vitae turpis sed erat eleifend pretium. Aenean eget justo mattis, bibendum diam at, accumsan elit."
//        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce scelerisque at felis a aliquet. Phasellus vitae turpis sed erat eleifend pretium. Aenean eget justo mattis, bibendum diam at, accumsan elit. In urna risus, hendrerit quis convallis vel, venenatis et nisi. Aenean ac nunc eu est posuere feugiat at in urna. Integer a pellentesque purus. Etiam tellus risus, varius vel lacus et, suscipit feugiat nulla. Nullam ut aliquam eros. Proin risus lacus, euismod a euismod nec, posuere eu elit.\nPellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean quam leo, porta et pretium accumsan, lacinia in ex. Etiam nisl sapien, dapibus ut orci et, aliquam lacinia diam. Fusce hendrerit elit sit amet lacus pretium venenatis. Mauris vel blandit massa, ut accumsan orci. Fusce in dolor eleifend, dapibus tortor ut, porttitor tellus. Maecenas tincidunt eu est nec aliquet. Ut pharetra facilisis lorem nec placerat. Nullam turpis mauris, fringilla et lacinia sit amet, aliquet nec nibh. Pellentesque lobortis ultricies sapien, non volutpat elit posuere vitae. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean facilisis enim id aliquet efficitur. Curabitur a varius leo, vel tincidunt massa. Vivamus non tortor fermentum, dictum justo vel, mattis felis. Sed pharetra odio mi, vitae ullamcorper nibh posuere nec."
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .cyan
        textField.placeholder = "Логин"
        textField.textColor = .darkText
        textField.font = .systemFont(ofSize: 20, weight: .regular)
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton.init()
        button.backgroundColor = .purple
        button.setTitle("Войдите", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
}

extension ViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let decimalDigitsSet = NSCharacterSet.decimalDigits
        let separatedCharacters = string.components(separatedBy: decimalDigitsSet)
        let decimalDigitsSetFiltered = separatedCharacters.joined(separator: "")
        return string == decimalDigitsSetFiltered
    }
}
