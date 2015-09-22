class AddUserFirstLastProfileNames < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :profile_name, :string

    add_index :users, :profile_name, unique: true
  end
end
