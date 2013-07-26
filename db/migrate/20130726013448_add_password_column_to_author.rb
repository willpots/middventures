class AddPasswordColumnToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :password, :string
  end
end
