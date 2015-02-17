class CreateTourPrices < ActiveRecord::Migration
  def change
    create_table :tour_prices do |t|
      t.string :name
      t.integer :duration
      t.decimal :price_adult
      t.decimal :price_child
      t.string :currency

      t.timestamps
    end
  end
end
