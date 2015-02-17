class AddTourPriceToTours < ActiveRecord::Migration
  def change
    add_column :tours, :tour_price_id, :integer
  end
end
