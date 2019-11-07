class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.boolean :is_active
      t.json :data
      t.string :name
      t.timestamps
    end
    add_reference :profiles, :account, foreign_key: true, optional: false
  end
end
