class FixReviewerName < ActiveRecord::Migration
  def change
    def change
      rename_column :reviews, :review, :reviewer
    end
  end
end
