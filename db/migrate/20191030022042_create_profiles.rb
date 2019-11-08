class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.boolean :hide_age
      t.boolean :hide_distance
      t.boolean :is_traveling
      t.date :birthdate
      t.string :city
      t.string :gender
      t.string :instagram_username
      t.string :name, required: true
      t.string :tinder_id
      t.text :bio
      t.text :jobs, array: true
      t.text :photos, array: true
      t.text :schools, array: true

      # Timestamps
      t.timestamp :active_at
      t.timestamp :created_at
      t.timestamp :deleted_at
      t.timestamp :updated_at
      t.references :account, foreign_key: true, required: true
    end
  end
end
