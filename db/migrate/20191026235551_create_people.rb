class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.date :birthdate
      t.integer :distance_mi
      t.string :gender
      t.string :instagram_id
      t.string :instagram_username
      t.text :bio
      t.string :name

      # Collections
      t.string :common_friends
      t.string :schools
      t.string :teaser
      t.string :jobs
      t.text :photos
      t.text :instagram_photos

      # Keys provided by tinder
      t.string :match_id
      t.string :tinder_id

      # Timestamps
      t.timestamp :active_at
      t.timestamp :created_at
      t.timestamp :deleted_at
      t.timestamp :muted_at
      t.timestamp :updated_at

      # Flags
      t.boolean :is_traveling
      t.boolean :hide_age
      t.boolean :hide_distance
    end
  end
end