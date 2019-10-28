class CreateRawData < ActiveRecord::Migration[6.0]
  def change
    create_table :raw_data do |t|
      t.datetime :imported_at
      t.json :data
      t.string :tag
      t.timestamps
    end
  end
end
