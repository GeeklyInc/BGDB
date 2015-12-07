class Boardgame < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :title, presence: true

  def review_score
    self.reviews.average(:score)
  end
end
