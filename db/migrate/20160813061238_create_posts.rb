class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :facebook_id
      t.string :content
      t.integer :share_count
      t.integer :like_count
      t.integer :comment_count

      t.timestamps
    end
  end
end
