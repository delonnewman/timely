class AddStartedAtAndStatus < ActiveRecord::Migration[7.1]
  def up
    change_column :time_entries, :minutes, :integer, null: true
    add_column :time_entries, :status, :integer, default: 0, null: false
    add_column :time_entries, :started_at, :timestamp
    TimeEntry.update_all('started_at = created_at')
  end

  def down
    remove_column :time_entries, :started_at
    remove_column :time_entries, :status
    change_column :time_entries, :minutes, :integer, null: false
  end
end
