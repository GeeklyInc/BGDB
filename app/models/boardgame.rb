class Boardgame < ActiveRecord::Base
  validates :title, presence: true
end
