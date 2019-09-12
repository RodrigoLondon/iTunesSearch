//
//  ViewController.swift
//  iTunesSearch
//
//  Created by Lewis Jones on 10/10/2018.
//  Copyright © 2018 Rodrigo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var resultsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func searchButton(_ sender: UIButton) {
        
        guard let term = searchTextField.text else { return }
        SearchResultsController.searchResultForSearchTerm(searchTerm: term) { [weak self] (results) in
            if let searchResults = results,
                let firstResult = searchResults.first {
                DispatchQueue.main.async {
                    self?.resultsLabel.text = "\(firstResult.trackName) - \(firstResult.artistName)"
                }
            }
        }
    }
}

