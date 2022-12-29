class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :token, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.string :password_digest
      t.string :image

      t.timestamps
    end

    add_index :users, :token, unique: true
    add_index :users, :address, unique: true
  end
end
