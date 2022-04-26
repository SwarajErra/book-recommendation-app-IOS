//
//  DetailViewController.swift
//  Bookrec

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var UiImage: UIImageView!
    var detailItem: Book? {
        didSet {
        }
    }

    func configureView() {
        if let detail: Book = self.detailItem {
            titleLabel.text = detail.title
            authorLabel.text = detail.author
            descriptionTextView.text = detail.description
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageArray : [UIImage] = [UIImage(#imageLiteral(resourceName: "0.jpeg")),UIImage(#imageLiteral(resourceName: "1.jpeg")),UIImage(#imageLiteral(resourceName: "2.jpeg")),UIImage(#imageLiteral(resourceName: "4.jpeg")),UIImage(#imageLiteral(resourceName: "0.jpeg")),UIImage(#imageLiteral(resourceName: "Logo2"))]
        UiImage.image =  imageArray[Int.random(in: 0...5)]
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

