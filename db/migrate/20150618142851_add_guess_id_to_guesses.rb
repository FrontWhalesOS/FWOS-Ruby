class AddGuessIdToGuesses < ActiveRecord::Migration
  def change
    add_column :guesses, :guess_id, :integer
  end
end
