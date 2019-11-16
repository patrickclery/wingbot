class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.date :birthdate
      t.integer :distance_mi
      t.string :gender
      t.string :instagram_id
      t.string :instagram_username
      t.string :name
      t.text :bio

      # Collections
      t.json :city
      t.json :common_friends
      t.json :instagram_photos
      t.json :jobs
      t.json :photos
      t.json :schools
      t.json :teaser

      # Keys provided by tinder
      t.string :tinder_id, required: true

      # Timestamps
      t.timestamp :active_at
      t.timestamp :created_at
      t.timestamp :deleted_at
      t.timestamp :updated_at

      # Flags
      t.boolean :is_traveling
      t.boolean :hide_age
      t.boolean :hide_distance

      t.references :account, foreign_key: true
    end
  end
end
