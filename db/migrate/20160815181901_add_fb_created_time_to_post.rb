class AddFbCreatedTimeToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :fb_created_time, :datetime
  end
end
