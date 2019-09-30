class CreateRawData < ActiveRecord::Migration[6.0]
  def change
    create_table :raw_data do |t|
      t.json :data
      t.string :tag
      t.datetime :imported_at

      t.timestamps
    end
  end
end
