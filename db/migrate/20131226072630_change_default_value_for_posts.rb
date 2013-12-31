class ChangeDefaultValueForPosts < ActiveRecord::Migration
  def change
    change_column :forums, :no_of_posts, :integer, default: 0
  end
end
