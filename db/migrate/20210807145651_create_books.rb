class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.integer :user_id
      t.string :title
      t.string :author
      t.string :publisher
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
