class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |user|
      user.string :username
      user.string :password
      user.string :name
      user.timestamps
    end
  end
end
