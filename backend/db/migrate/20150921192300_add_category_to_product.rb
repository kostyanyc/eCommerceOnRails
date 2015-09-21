class AddCategoryToProduct < ActiveRecord::Migration
  def change
  	create_table :taxanomies do |t|
      t.references :variants, index: true
      t.references :categories, index: true
      t.timestamps null: false
    end
  end
end
