class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.datetime :created_at
      t.string :name
      t.string :short_description

      t.timestamps
    end
  end
end
