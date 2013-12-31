class ChangeColumnPostsCount < ActiveRecord::Migration
  def change
    rename_column :forum_threads, :posts_count, :forum_posts_count
  end
end
