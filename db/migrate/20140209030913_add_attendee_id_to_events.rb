class AddAttendeeIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :attendee_id, :integer
    add_index :events, :attendee_id
  end
end
