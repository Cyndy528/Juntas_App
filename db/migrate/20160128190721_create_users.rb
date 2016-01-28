class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :avatar
      t.string :password_digest
      t.string :bio
      t.string :provider
  
      t.timestamps null: false
    end
  end
end
