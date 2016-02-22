class CreateContactForms < ActiveRecord::Migration
  def change
    create_table :contact_forms do |t|
      t.text :content
      t.string :email
      t.integer :contact_type

      t.timestamps null: false
    end
  end
end
