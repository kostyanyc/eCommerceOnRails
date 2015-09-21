class AddIndexToCategoriesTitle < ActiveRecord::Migration
  def change
  	add_index :categories, [:title],         :name => 'index_categories_on_title'
  end
end
