class CreateClips < ActiveRecord::Migration[8.0]
  def change
    create_table :clips do |t|
      t.string :title
      t.string :video_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
