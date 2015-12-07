class Review < ActiveRecord::Base
  belongs_to :boardgame
  validates :score, :inclusion => 1..10
end
