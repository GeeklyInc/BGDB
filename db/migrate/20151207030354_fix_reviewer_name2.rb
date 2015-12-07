class FixReviewerName2 < ActiveRecord::Migration
  def change
    rename_column :reviews, :review, :reviewer
  end
end
