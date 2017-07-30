class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations, primary_key: :_id do |t|
      t.string :url
      t.string :external_id, unique: true, null: false
      t.string :name
      t.text :domain_names, array: true
      t.datetime :created_at
      t.text :details
      t.boolean :shared_tickets
      t.text :tags, array: true

      t.text :domain_names, array: true
    end

    add_index :organizations, :_id
    add_index :organizations, :external_id
    add_index :organizations, :name
    add_index :organizations, :shared_tickets
  end
end
