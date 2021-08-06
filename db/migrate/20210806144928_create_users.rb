class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :birthday
      t.string :street_adress
      t.integer :phone_number
      t.string :nickname
      t.string :introduction
      t.string :password_digest

      t.timestamps
    end
  end
end
