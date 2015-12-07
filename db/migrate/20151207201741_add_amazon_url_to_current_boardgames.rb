class AddAmazonUrlToCurrentBoardgames < ActiveRecord::Migration
  def up
    Boardgame.find_each do |game|
      if game.amazon_link.nil? || game.amazon_link.empty?
        unless game.asin.empty?
          game.amazon_link = AmazonProxy.get_link(game.asin)
          game.save!
        end
      end
    end
  end

  def down
    # remove_column :users, :status
  end
end
