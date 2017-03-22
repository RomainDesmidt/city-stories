class CreatePois < ActiveRecord::Migration[5.0]
  def change
    create_table :pois do |t|
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
