//
//  ImageViewController.swift
//  Combine-ObserveOn-ReceiveOn-Example
//
//  Created by Alan Casas on 23/09/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    let IMAGE_URL = "https://picsum.photos/400/400/?random"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setTimeLabel()
        
    }


    @IBAction func downloadButton(_ sender: Any) {
        
        print("------------")
        
        if let url = URL(string: IMAGE_URL) {
            let data = try? Data(contentsOf: url) 
            if let image = UIImage(data: data ?? Data()) {
                imageView.image = image
            }
        }
        
    }
    
    func currentThreadName () -> String {
        return OperationQueue.current?.name ?? "Uknown thread"
    }
    
    func setTimeLabel () {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.timeLabel.text = "\(Date().timeIntervalSince1970 * 1000)"
        }
    }
    
    
}
