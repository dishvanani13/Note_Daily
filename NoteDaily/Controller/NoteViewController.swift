//
//  NoteViewController.swift
//  NoteDaily
//
//  Created by Disha Limbani on 2025-01-23.
//

import UIKit
import CoreData

class NoteViewController: UIViewController {

    var noteList = [Note]()
    
    @IBOutlet weak var txtViewDescription: UITextView!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    
    @IBOutlet weak var btnBack: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickBtnSave(_ sender: UIButton) {
       
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appdelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
        let notecell = Note(entity: entity!, insertInto: context)
        notecell.id = noteList.count as NSNumber
        
        notecell.title = txtTitle.text
        
        notecell.preview = txtViewDescription.text
        print("note print is here :  \(notecell.preview)")
        do{
            try context.save()
            noteList.append(notecell)
            print("Data is Added ")
            navigationController?.popViewController(animated: true)
        }
        catch {
            print("error :  \(error)")
        }
    }
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
