//
//  ViewController.swift
//  BoxOffice
//
//  Created by kjs on 13/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let loadData = LoadData()
        let bundle = Bundle(for: type(of: self))
        if let movieData = loadData.loadData(from: bundle) {
            dump(movieData)
        }
    }
    
}

