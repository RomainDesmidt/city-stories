class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar, :string
    add_column :users, :pseudo, :string
    add_column :users, :description, :text
  end
end
