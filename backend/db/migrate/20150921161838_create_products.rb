class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, :null => false
      t.string :slug
      t.string :description
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords

      t.timestamps null: false
    end

    add_index :products, [:title],         :name => 'index_products_on_title'

  end
end
