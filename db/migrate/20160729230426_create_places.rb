class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :location
      t.decimal :price
      t.date :dates_available

      t.timestamps
    end
  end
end
