//
//  EditNotesCell.swift
//  Today
//
//  Created by Daniil Zadorozhnyy on 02.07.2021.
//

import Foundation
import UIKit

class EditNotesCell: UITableViewCell {
  typealias NotesChangeAction = (String) -> Void
  
  @IBOutlet var notesTextView: UITextView!
  
  private var notesChangeAction: NotesChangeAction?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    notesTextView.delegate = self
  }
  
  func configure(text: String?, changeAction: @escaping NotesChangeAction) {
    notesTextView.text = text
    self.notesChangeAction = changeAction
  }
}

extension EditNotesCell: UITextViewDelegate {
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    if let originalText = textView.text {
      let title = (originalText as NSString).replacingCharacters(in: range, with: text)
      notesChangeAction?(title)
    }
    return true
  }
}
