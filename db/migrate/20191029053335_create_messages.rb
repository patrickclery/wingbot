class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages, force: :cascade do |t|
      t.text      :content
      t.timestamp :deleted_at
      t.integer   :from_id
      t.integer   :person_id
      t.integer   :reply_id
      t.datetime  :sent_at
      t.string    :tinder_id
      t.string    :tinder_match_id
      t.string    :tinder_message_id
      t.timestamp :tinder_timestamp
      t.integer   :to_id
      t.timestamps
    end
  end
end
