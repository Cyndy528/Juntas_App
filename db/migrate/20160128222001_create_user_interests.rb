class CreateUserInterests < ActiveRecord::Migration
  def change
    create_table :user_interests do |t|

      t.timestamps null: false

      t.belongs_to :user
      t.belongs_to :interest
    end
  end
end
