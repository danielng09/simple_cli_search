class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets, id: false, primary_key: :_id  do |t|
      t.string :_id, unique: true, null: false
      t.string :url
      t.string :external_id, unique: true, null: false
      t.datetime :created_at
      t.string :type
      t.string :subject
      t.string :description
      t.string :priority
      t.string :status
      t.integer :submitter_id
      t.integer :assignee_id
      t.text :tags, array: true, default: []
      t.boolean :has_incidents
      t.datetime :due_at
      t.string :via
      t.integer :organization_id, unique: true
    end

    # add_reference :tickets, :organization
    # add_foreign_key :tickets, :organizations, column: :organization_id, primary_key: :_id

    add_index :tickets, :organization_id
    add_index :tickets, :_id
    add_index :tickets, :external_id
    add_index :tickets, :submitter_id
    add_index :tickets, :assignee_id
    add_index :tickets, :has_incidents
  end
end
