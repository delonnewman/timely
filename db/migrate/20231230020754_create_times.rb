class CreateTimes < ActiveRecord::Migration[7.1]
  def change
    create_table :timers do |t|
      t.belongs_to :project, type: :uuid, foreign_key: true, index: true, null: false
      t.timestamp :created_at, null: false
      t.timestamp :ended_at
    end
  end
end
