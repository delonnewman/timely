class CreateDashboard < ActiveRecord::Migration[7.1]
  def change
    create_table :dashboards do |t|
      t.belongs_to :user, foreign_key: true, null: false, index: true

      t.timestamps
    end

    create_table :widget_placements do |t|
      t.belongs_to :dashboard, foreign_key: true, null: false, index: true
      t.string :widget_class_name, null: false
      t.integer :position_horizontal, null: false
      t.integer :position_vertical, null: false
      t.json    :meta_data

      t.timestamps
    end
  end
end
