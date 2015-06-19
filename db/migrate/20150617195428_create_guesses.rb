class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :user_id #owner
      t.integer :post_id
      t.string :guess
      t.integer :points

      t.timestamps null: false
    end
  end
end
