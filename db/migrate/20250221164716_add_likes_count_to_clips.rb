class AddLikesCountToClips < ActiveRecord::Migration[8.0]
  def change
    add_column :clips, :likes_count, :integer, default: 0, null: false
  end
end
