class CommentPartTwo < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    add_column :comments, :item_id, :integer
  end
end
