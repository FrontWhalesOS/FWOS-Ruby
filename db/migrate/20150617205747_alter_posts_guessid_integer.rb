class AlterPostsGuessidInteger < ActiveRecord::Migration
  def self.up
    change_column :products do |t|
      t.change :guess_id, :integer
    end
  end
  def self.down
    change_table :products do |t|
      t.change :guess_id, :integer
    end
  end
end
