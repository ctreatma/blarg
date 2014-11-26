class CreateSocialLinks < ActiveRecord::Migration
  def change
    create_table :social_links do |t|
      t.string :site
      t.string :account_id
      t.references :user, index: true

      t.timestamps
    end
  end
end
