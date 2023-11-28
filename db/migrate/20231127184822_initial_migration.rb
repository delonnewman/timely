class InitialMigration < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :name

      t.timestamps
    end

    create_table :projects, id: :uuid do |t|
      t.belongs_to :group, foreign_key: true, index: true
      t.string :name, null: false, index: true
      t.integer :rounding_factor, null: false, index: true, default: 15

      t.timestamps
    end

    create_table :pay_rates do |t|
      t.belongs_to :project, type: :uuid, foreign_key: true, index: true
      t.decimal :magnitude, null: false
      t.string :unit, null: false

      t.timestamps
    end

    create_table :time_entries, id: :uuid do |t|
      t.belongs_to :project, type: :uuid, foreign_key: true, index: true, null: false
      t.integer :minutes, null: false, index: true
      t.string :description

      t.timestamps
    end
  end
end
