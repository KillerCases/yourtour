class ChangeDataTypeOfLongDescription < ActiveRecord::Migration
  def change
    change_column :tours, :long_description, :text
  end
end
