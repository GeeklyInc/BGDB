class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :review
      t.text :body
      t.references :boardgame, index: true
      t.integer :score

      t.timestamps null: false
    end
    add_foreign_key :reviews, :boardgames
  end
end
