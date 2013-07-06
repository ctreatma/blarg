class AddAboutUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :about_url, :string
  end
end
