class AddFanpageIdToPost < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :fanpage, foreign_key: true
  end
end
