class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.datetime :created_at
      t.string :name
      t.string :description_short

      t.timestamps
    end
  end
end
