class AddAmazonLinkLowestPriceToBoardgames < ActiveRecord::Migration
  def change
    add_column :boardgames, :amazon_link, :string
    add_column :boardgames, :lowest_price, :integer
    add_column :boardgames, :small_image, :string
  end
end
