class AddPublishedToJourneys < ActiveRecord::Migration[5.0]
  def change
    add_column :journeys, :published, :boolean, default: false
  end
end
