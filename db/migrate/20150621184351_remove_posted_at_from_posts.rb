class RemovePostedAtFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :posted_at, :datetime
  end
end
