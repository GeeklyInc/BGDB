class Boardgame < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :title, presence: true

  def review_score
    self.reviews.average(:score)
  end

  def current_price
    price = AmazonProxy.get_price(self.asin)
    check_lowest_price(price)
    price[:formated_price]
  end

  def lowest_price_formatted
    price = self.lowest_price.to_s
    if price.length >= 4
      '$' + self.lowest_price.to_s.insert(-3,'.')
    end
  end
  private
    def check_lowest_price current_price
      if self.lowest_price.nil? || current_price[:amount] < self.lowest_price
        self.update(lowest_price: current_price[:amount])
        self.update(lowest_price_formatted: current_price[:formated_price])
      end
    end
end
