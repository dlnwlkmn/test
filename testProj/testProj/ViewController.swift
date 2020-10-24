//
//  ViewController.swift
//  testProj
//
//  Created by Алексей Савельев on 28.09.2020.
//

import UIKit

class ViewController: UIViewController {
    
    let titleList = ["Добро пожаловать в приложение TravelNote",
                     "Умное слово",
                     "Другое умное слово",
                     "И тд."]
    let bodyList = ["Спасибо за установку нашего приложения для путешественников",
                     "Объяснение чегото, связанного с Умным словом",
                     "Объяснение чегото другого, связанного с умным словом",
                     "И тд."]
    var counter = 0
    let titleLable = UILabel()
    let bodyLable = UILabel()
    var button = UIButton()
    
    fileprivate func setupLables() {
        titleLable.backgroundColor = .red
        titleLable.font = UIFont(name: "Futura", size: 20)
        titleLable.text = titleList[counter]
        titleLable.numberOfLines = 0
        
        bodyLable.backgroundColor = .green
        bodyLable.text = bodyList[counter]
        bodyLable.numberOfLines = 0
        
        counter += 1
    }
    
    fileprivate func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLable, bodyLable])
        
        stackView.axis = .vertical
        //        stackview.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        self.view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        setupLables()
        setupStackView()
        
        // fun animations
        view.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeAnimations)))

        
    }
    
    @objc fileprivate func handleSwipeAnimations() {
        print("Animations")
        // Анимация сдвига заголовка влево
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.titleLable.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) {(_) in
            // Следующая анимация с движением заголовка вверх
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.titleLable.alpha = 0
                self.titleLable.transform =
                    self.titleLable.transform.translatedBy(x: 0, y: -200)
                
            })
        }
        // Анимация сдвига тела влево с задержкой 0.4
        UIView.animate(withDuration: 0.5, delay: 0.4, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.bodyLable.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) {(_) in
            // Следующая анимация с движением тела вверх
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.bodyLable.alpha = 0
                self.bodyLable.transform =
                    self.bodyLable.transform.translatedBy(x: 0, y: -200)
                
            })
            
        }
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
//
//            self.titleLable.transform.translatedBy(x: 0, y: 200)
//            self.bodyLable.transform.translatedBy(x: 0, y: 200)
//            self.titleLable.alpha = 1
//            self.bodyLable.alpha = 1
//
//        })
        
    }
    
}






