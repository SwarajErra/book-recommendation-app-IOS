//
//  Book.swift
//  BookRec



import Foundation

class Book {
    var title:String = ""
    var author = ""
    var description = ""
    var publisher = ""
    var genre = ""
    
    
    init(){
    }
    
    init(title:String, author:String, description:String){
        self.title = title
        self.author = author
        self.description = description
    }
}
