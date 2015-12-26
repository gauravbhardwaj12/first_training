class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :name
      t.float :price
      t.string :color

      t.timestamps null: false
    end
  end
end
