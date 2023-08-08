//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Edward Kheladze on 27.07.2023.
//

import UIKit

// Контроллер для отображения и поиска персонажа
final class RMCharacterViewController: UIViewController {
    
    
    private let characterListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters" 
        setUpView()
        
                
            }
    private func setUpView() {
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            ])
    }
        }
                                 
