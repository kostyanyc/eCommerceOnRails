class FixColumnNameForImagesProductId < ActiveRecord::Migration
  def change
  	rename_column :images, :products_id, :product_id
  end
end
