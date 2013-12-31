class ThreadsCount < ActiveRecord::Migration
  def change
    add_column :forums, :threads_count, :integer, default: 0
  end
end
