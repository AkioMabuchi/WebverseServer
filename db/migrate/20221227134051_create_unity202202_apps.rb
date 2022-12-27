class CreateUnity202202Apps < ActiveRecord::Migration[6.1]
  def change
    create_table :unity202202_apps do |t|
      t.string :loader_file
      t.string :data_file
      t.string :framework_file
      t.string :code_file

      t.timestamps
    end
  end
end
