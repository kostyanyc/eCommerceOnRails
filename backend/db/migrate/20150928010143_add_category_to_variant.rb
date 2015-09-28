class AddCategoryToVariant < ActiveRecord::Migration
  def change
  	add_column :variants, :category_id, :integer
  end
end
