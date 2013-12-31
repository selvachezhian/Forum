class ChangeThreadCount < ActiveRecord::Migration
  def change
    rename_column :forums, :threads_count, :forum_threads_count
  end
end
