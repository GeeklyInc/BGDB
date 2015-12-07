class AddColumnsToBoardgames < ActiveRecord::Migration
  def change
    add_column :boardgames, :asin, :string
    add_column :boardgames, :published_at, :date
    add_column :boardgames, :author, :string
    add_column :boardgames, :amazon_image_url, :string
  end
end
