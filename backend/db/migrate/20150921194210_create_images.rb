class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file_name, :null => false
      t.string :title
      t.string :description
      t.string :meta_alt
      t.references :products

      t.timestamps null: false
    end
  end
end
