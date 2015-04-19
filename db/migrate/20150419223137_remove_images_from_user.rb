class RemoveImagesFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :user_image_file_name, :string
    remove_column :users, :user_image_content_type, :string
    remove_column :users, :user_image_file_size, :integer
    remove_column :users, :user_image_updated_at, :datetime
  end
end
