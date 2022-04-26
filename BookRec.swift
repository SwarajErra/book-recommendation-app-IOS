//
//  BookRec.swift
//  BookRec

import Foundation

class BookRec {
    var name = ""
    var theBookRec: [Book] = []
    var prefs = UserDefaults.init()
    
    init(){
        var newBook = Book()
        newBook.title = "SpiderMan"
        newBook.author = "Marvel"
        newBook.description = "The famous spiderman book series is here."
        theBookRec.append(newBook)
        
        newBook = Book()
        newBook.title = "Batman"
        newBook.author = "DC comics"
        newBook.description = "the latest version of batman, newly relased series is here."
        theBookRec.append(newBook)
        
        newBook = Book()
        newBook.title = "Sherlock Holmes"
        newBook.author = "Sir Arthur Conan Doyle"
        newBook.description = "Worlds leading detective novels are now into new chapter!"
        theBookRec.append(newBook)
        
        newBook = Book()
        newBook.title = "RRR"
        newBook.author = "DVV Productions"
        newBook.description = "The new books RRR is about two indian freedom fighters."
        theBookRec.append(newBook)
        
        newBook = Book()
        newBook.title = "The Thruth"
        newBook.author = "sheldon"
        newBook.description = "The story of an affair between an English nurse and an American soldier on the Italian front during World War I."
        theBookRec.append(newBook)
        
        newBook = Book()
        newBook.title = "The Wheel of Time"
        newBook.author = "Robert jordan"
        newBook.description = "The fantasy book has ganied huge popularity after its recent hit book."
        theBookRec.append(newBook)
        
        newBook = Book()
        newBook.title = "World War 2"
        newBook.author = "Hitler"
        newBook.description = "The story of an affair between an English nurse and an American soldier on the Italian front during World War 2."
        theBookRec.append(newBook)    }
    
    class var sharedInstance: BookRec {
        struct Static {
            static let instance = BookRec()
        }
        return Static.instance
    }
    
    var count:Int {
        return theBookRec.count
    }
    
    func addBook(book:Book) {
        theBookRec.append(book)
    }
    
    func replace(book: Book, atIndex index: Int) {
        theBookRec[index] = book
    }
    
    func removeBook(index:Int) {
        theBookRec.remove(at: index)
    }
    
    func book(index:Int) -> Book{
        return theBookRec[index]
    }
    
    func sort() {
        theBookRec.sort(by: alphabetOrder)
    }
    
    
    // MARK: - Utilities
    
    func alphabetOrder(value1:Book, value2:Book)-> Bool {
        return value1.title < value2.title
    }

}
