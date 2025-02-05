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
    var firstLoad = true
    
   // outlets
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var btnAddNewNote: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.dataSource = self
        tblView.delegate = self
        
        if(firstLoad)
        {
            firstLoad = false
            fetchDataFromCore()
            
        }
    }
    func fetchDataFromCore(){
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appdelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        do {
            let results:NSArray = try context.fetch(request) as NSArray
            for result in results {
                noteList.append(result as! Note)
                
            }
        }catch {
            print("error \(error)")
        }
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
        cell.lblPreview.text = noteList[indexPath.row].preview
       // cell.lblPreview.text = noteList[indexPath.row].noteDescription

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchDataFromCore()
        tblView.reloadData()
    }
    
}

