//
//  NoteTableViewController.swift
//  ProjectPassingDataFromOneViewToAnother
//
//  Created by Kalin Karev on 4/22/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit
import os.log

class NoteTableViewController: UITableViewController {

    // MARK: Properties
    @IBOutlet var myTableView: UITableView!
    
    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        
        // Set title to the navigation bar
        navigationItem.title = "Your Notes"
        
        // Load the sample data.
        loadSampleNotes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table views cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "NoteTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NoteTableViewCell else {
            fatalError("The dequeued cell is not an instance of NoteTableViewCell.")
        }
        
        // Fetches the appropriate note for the data source layout.
        let note = notes[indexPath.row]

        cell.nameLabel.text = note.name
        
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            notes.remove(at: indexPath.row) // removs the Note object to be deleted from notes
            tableView.deleteRows(at: [indexPath], with: .fade) // deletes the corresponding row from the tableview
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
        case "AddItem":
            os_log("Adding a new note.", log: OSLog.default, type: .debug)
        case "ShowDetail":
            guard let noteDetailViewController = segue.destination as? ViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedNoteCell = sender as? NoteTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            guard let indexPath = tableView.indexPath(for: selectedNoteCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedNote = notes[indexPath.row]
            noteDetailViewController.note = selectedNote
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }

    // MARK: Actions
    @IBAction func unwindToNoteList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ViewController, let note = sourceViewController.note {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow { // checks whether a row in the table view is selected.
                // Update an existing note.
                notes[selectedIndexPath.row] = note // updates the notes array. Replace the old note object with the new, edited note object.
                tableView.reloadRows(at: [selectedIndexPath], with: .none) // reloads the appropriate row in the table view. Replaces the current cell with a new cell that contains the updated note data.
            } else { // executes when there`s no selected row in the table view
                // Add a new note.
                let newIndexPath = IndexPath(row: notes.count, section: 0)
                notes.append(note)
                myTableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    
    // MARK: Private Methods
    private func loadSampleNotes() {
        guard let note1 = Note(name: "Have breakfast") else {
            fatalError("Unable to instantiate note1")
        }
        guard let note2 = Note(name: "Have lunch") else {
            fatalError("Unable to instantiate note2")
        }
        guard let note3 = Note(name: "Have dinner") else {
            fatalError("Unable to instantiate note3")
        }
        
        notes += [note1, note2, note3]
    }
    
}
