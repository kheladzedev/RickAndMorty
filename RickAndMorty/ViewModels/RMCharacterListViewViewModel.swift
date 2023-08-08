//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Edward Kheladze on 31.07.2023.
//

import UIKit

final class RMCharacterListViewViewModel: NSObject {
    
    private var characters: [RMCharacter] = []
    private var cellViewModels: [RMCharacterCollectionViewCellViewModel] = []
    
    public func fetchCharacters() {
        RMService.shared.execute(
            .listCharactersRequest,
            expecting: RMGetAllCharactersResponse.self) { [weak self] result in
                switch result {
                case .success(let responseModel):
                    let results = responseModel.results
                    self?.characters = results
                    self?.createCellViewModels()
                case .failure(let error):
                    print(String(describing: error))
                }
            }
    }
    
    private func createCellViewModels() {
        for character in characters {
            guard let characterImageUrl = URL(string: character.image) else {
                continue
            }
            let viewModel = RMCharacterCollectionViewCellViewModel(
                characterName: character.name,
                characterStatus: character.status,
                characterImageUrl: characterImageUrl)
            
            cellViewModels.append(viewModel)
        }
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width, height: width * 1.5)
    }
}

