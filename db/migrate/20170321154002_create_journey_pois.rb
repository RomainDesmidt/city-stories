class CreateJourneyPois < ActiveRecord::Migration[5.0]
  def change
    create_table :journey_pois do |t|
      t.references :journey, foreign_key: true
      t.references :poi, foreign_key: true
      t.string :name
      t.text :description
      t.string :photo
      t.text :text
      t.string :video
      t.string :sound

      t.timestamps
    end
  end
end
