class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :parent
      t.string :title, :null => false
      t.string :slug
      t.string :description
      t.integer :sort_order
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords

      t.timestamps null: false
    end
  end
end
