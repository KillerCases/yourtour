class DropLongDescriptionAddLongDescription < ActiveRecord::Migration
  def change
    remove_column :tours, :long_description
    add_column :tours, :long_description, :text
  end
end
