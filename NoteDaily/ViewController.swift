//
//  ViewController.swift
//  NoteDaily
//
//  Created by Disha Limbani on 2025-01-21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var searchTitle: UISearchBar!
    var arrList = [1,2,3,4,5,6]
    
    @IBOutlet weak var lblCount: UILabel!
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var btnAddNewNote: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.dataSource = self
        tblView.delegate = self
    }


}
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "goToCell", for: indexPath)
        cell.textLabel?.text = String(arrList[indexPath.row])
        return cell
    }
    
    
}

