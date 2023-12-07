class InitialMigration < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.index :name, unique: true

      t.timestamps
    end

    create_table :users do |t|
      t.belongs_to :team, foreign_key: true, null: false, index: true

      t.string :name
      t.string :login, null: false

      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.index  :email,              unique: true
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.index    :reset_password_token, unique: true
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.index    :confirmation_token, unique: true
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      t.timestamps null: false
    end

    create_table :groups do |t|
      t.belongs_to :team, foreign_key: true, index: true, null: false

      t.string :name, null: false
      t.index :name, unique: true

      t.timestamps
    end

    create_table :projects, id: :uuid do |t|
      t.belongs_to :group, foreign_key: true, index: true, null: false

      t.string :name, null: false, index: true
      t.integer :rounding_factor, null: false, index: true, default: 15
      t.boolean :billable, null: false, default: false, index: true

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
      t.belongs_to :user, foreign_key: true, index: true, null: false

      t.integer :minutes, null: false, index: true
      t.string :description

      t.timestamps
    end

  end
end
