//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Edward Kheladze on 27.07.2023.
//

import UIKit

// Контроллер для отображения и поиска персонажа
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(
        endpoint: .character,
        queryParameters: [
        URLQueryItem(name: "name", value: "rick"),
        URLQueryItem(name: "status", value: "alive")
        ]

        )
        print(request.url)
        
        RMService.shared.execute(request, expencting: RMCharacter.self) { result in
            
        }
    }

}
