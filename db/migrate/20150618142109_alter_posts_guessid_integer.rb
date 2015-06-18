class AlterPostsGuessidInteger < ActiveRecord::Migration
  def change
  def self.up
    change_column :posts, :guess_id, :integer
  end

  def self.down
    change_column :posts, :guess_id, :integer
  end
  end

end
