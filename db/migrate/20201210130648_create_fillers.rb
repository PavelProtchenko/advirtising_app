class CreateFillers < ActiveRecord::Migration[6.0]
  def change
    create_table :fillers do |t|
      t.string :name
      t.float :duration, precision: 2

      t.timestamps
    end
  end
end
