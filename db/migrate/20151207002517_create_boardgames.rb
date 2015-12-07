class CreateBoardgames < ActiveRecord::Migration
  def change
    create_table :boardgames do |t|
      t.string :title
      t.string :string
      t.text :description

      t.timestamps null: false
    end
  end
end
