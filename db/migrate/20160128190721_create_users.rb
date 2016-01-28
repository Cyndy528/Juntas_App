class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :avatar
      t.string :password
      t.string :bio
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
  end
end
