class CreateFanpages < ActiveRecord::Migration[5.0]
  def change
    create_table :fanpages do |t|
      t.string :name
      t.string :facebook_number
      t.integer :category_id

      t.timestamps
    end
  end
end
