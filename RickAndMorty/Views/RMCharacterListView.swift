//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Edward Kheladze on 31.07.2023.
//


import UIKit

final class RMCharacterListView: UIView {
    
    private let viewModel = RMCharacterListViewViewModel()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RMCharacterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterCollectionViewCell.celldentifier)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews(collectionView, spinner)
        addConstraints()
        spinner.startAnimating()
        viewModel.fetchCharacters()
        setUpCollectionView()
    }
    
    required init(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
           NSLayoutConstraint.activate([
               spinner.widthAnchor.constraint(equalToConstant: 100),
               spinner.heightAnchor.constraint(equalToConstant: 100),
               spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
               spinner.centerYAnchor.constraint(equalTo: centerYAnchor),

               collectionView.topAnchor.constraint(equalTo: topAnchor),
               collectionView.leftAnchor.constraint(equalTo: leftAnchor),
               collectionView.rightAnchor.constraint(equalTo: rightAnchor),
               collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
           ])
       }
    
    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.spinner.stopAnimating()
            
            self.collectionView.isHidden = false
            
            UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1
            }
        }
    }
}

