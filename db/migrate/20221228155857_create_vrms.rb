class CreateVrms < ActiveRecord::Migration[6.1]
  def change
    create_table :vrms do |t|
      t.string :token, null: false
      t.string :name, null: false
      t.string :body

      t.references :user, foreign_key: true
      t.timestamps
    end

    add_index :vrms, :token, unique: true
  end
end
