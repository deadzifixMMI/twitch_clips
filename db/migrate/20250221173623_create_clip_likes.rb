class CreateClipLikes < ActiveRecord::Migration[8.0]
  def change
    create_table :clip_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :clip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
