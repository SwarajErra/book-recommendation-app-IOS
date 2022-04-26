//
//  MasterViewController.swift
//  BookRec
//


import UIKit
import Firebase
class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        self.refreshControl?.addTarget(self, action: #selector(MasterViewController.reloadTableView), for: UIControl.Event.valueChanged)
        
    }

    @IBAction func LogOut(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
       do {
         try firebaseAuth.signOut()
           self.performSegue(withIdentifier: "GoFromSignOut", sender: self)
       } catch let signOutError as NSError {
         print("Error signing out: %@", signOutError)
       }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedBook = BookRec.sharedInstance.book(index: indexPath.row)
                
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = selectedBook
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
        else {
            self.tableView.reloadData()
        }
    }
    
    
    @objc func reloadTableView(refreshControl:UIRefreshControl){
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
   

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BookRec.sharedInstance.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        BookRec.sharedInstance.sort()
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let book = BookRec.sharedInstance.book(index: indexPath.row)
        cell.textLabel?.text? = book.title
        cell.detailTextLabel?.text? = book.author
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            BookRec.sharedInstance.removeBook(index: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }


}

