//
//  AddBookViewController.swift
//  BookRec
//


import UIKit

class AddBookViewController: UIViewController {

    @IBOutlet weak var bookTitle: UITextField!
    @IBOutlet weak var bookAuthor: UITextField!
    @IBOutlet weak var bookDesc: UITextField!
    
 
    override func viewDidLoad() {
        
       
       
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dismissAndSave" {
            let book = Book(title:bookTitle.text!, author: bookAuthor.text!, description: bookDesc.text!)
            BookRec.sharedInstance.addBook(book: book)
        }
    }
}
