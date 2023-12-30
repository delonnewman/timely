class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices, id: :uuid do |t|
      t.belongs_to :project, type: :uuid, foreign_key: true, index: true, null: false

      t.string :number, index: true, null: false
      t.date :start_on, index: true, null: false
      t.date :end_on, index: true, null: false

      t.timestamps
    end
  end
end
