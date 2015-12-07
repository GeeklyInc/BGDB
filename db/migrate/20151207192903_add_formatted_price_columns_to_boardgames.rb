class AddFormattedPriceColumnsToBoardgames < ActiveRecord::Migration
  def change
    add_column :boardgames, :lowest_price_formatted, :string
  end
end
