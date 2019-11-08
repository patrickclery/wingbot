class CreateRawData < ActiveRecord::Migration[6.0]
  def change
    create_table :raw_data do |t|
      t.json      :data
      t.datetime  :imported_at
      t.string    :tag
      t.timestamps

      t.references :account, foreign_key: true
    end
  end
end
