//
//  ViewController.swift
//  NoteDaily
//
//  Created by Disha Limbani on 2025-01-21.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var searchTitle: UISearchBar!
   // Variables
    var noteList = [Note]()
   
    
   // outlets
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var btnAddNewNote: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.dataSource = self
        tblView.delegate = self
    }

    @IBAction func btnAddNote(_ sender: UIButton) {
        let objVC = self.storyboard?.instantiateViewController(withIdentifier: "NoteViewController") as! NoteViewController
        
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
}
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "goToCell", for: indexPath) as! NoteTableViewCell
        cell.lblTitle.text = noteList[indexPath.row].title
        cell.lblPreview.text = noteList[indexPath.row].description
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

