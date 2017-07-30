class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, primary_key: :_id do |t|
      t.string :url
      t.string :external_id, unique: true, null: false
      t.string :name, null: false
      t.string :alias
      t.datetime :created_at
      t.boolean :active
      t.boolean :verified
      t.boolean :shared
      t.string :locale
      t.string :timezone
      t.datetime :last_login_at
      t.string :email, unique: true
      t.string :phone, unique: true, null: false
      t.string :signature
      t.text :tags, array: true
      t.boolean :suspended
      t.string :role
    end

    add_reference :users, :organization
    add_foreign_key :users, :organizations, column: :organization_id, primary_key: :_id

    add_index :users, :_id
    add_index :users, :external_id
    add_index :users, :name
    add_index :users, :alias
    add_index :users, :active
    add_index :users, :verified
    add_index :users, :shared
    add_index :users, :email
    add_index :users, :phone
    add_index :users, :role
    add_index :users, :suspended
    add_index :users, :organization_id
  end
end
