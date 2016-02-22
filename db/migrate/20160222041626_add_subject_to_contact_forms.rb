class AddSubjectToContactForms < ActiveRecord::Migration
  def change
    add_column :contact_forms, :subject, :string
  end
end
