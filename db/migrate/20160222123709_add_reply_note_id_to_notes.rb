class AddReplyNoteIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :reply_note_id, :integer
  end
end
