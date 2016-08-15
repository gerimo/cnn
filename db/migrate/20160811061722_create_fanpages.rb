class CreateFanpages < ActiveRecord::Migration[5.0]
  def change
    create_table :fanpages do |t|
      t.string :name
      t.string :facebook_number
      t.references :category, index: true

      t.timestamps
    end

    add_foreign_key :fanpages, :categories
  end
end
