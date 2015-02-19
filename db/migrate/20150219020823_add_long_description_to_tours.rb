class AddLongDescriptionToTours < ActiveRecord::Migration
  def change
    add_column :tours, :long_description, :string
  end
end
