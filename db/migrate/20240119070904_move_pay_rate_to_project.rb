class MovePayRateToProject < ActiveRecord::Migration[7.1]
  def up
    add_column :projects, :pay_rate_amount, :decimal, null: false, default: 75
    add_column :projects, :pay_rate_unit, :string, null: false, default: 'per_hour'

    drop_table :pay_rates
  end

  def down
    remove_column :projects, :pay_rate_amount
    remove_column :projects, :pay_rate_unit

    create_table :pay_rates do |t|
      t.belongs_to :project, type: :uuid, foreign_key: true, index: true

      t.decimal :magnitude, null: false
      t.string :unit, null: false

      t.timestamps
    end
  end
end
