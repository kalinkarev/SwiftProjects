//
//  UserNotes.swift
//  NotesApplication
//
//  Created by Kalin Karev on 3/19/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation
import UIKit

struct UserNotes {
    
    // Array for storing the notes (all the user notes are stored here)
    var notes: [Note] = []
    
    func addNote(newNote: Note) {
        
    }
    
    func deleteNote(deletedNote: Note) -> Note {
        return deletedNote
    }
    
}
