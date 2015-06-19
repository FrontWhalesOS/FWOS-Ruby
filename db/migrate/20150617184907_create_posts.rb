class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :image_url
      t.integer :user_id #owner
      t.string :answer #one
      t.string :guesses
      t.string :guess_id #solution

      t.timestamps null: false
    end
  end
end
