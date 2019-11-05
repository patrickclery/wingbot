class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages, force: :cascade do |t|
      t.text      :content
      t.string    :tinder_message_id
      t.boolean   :is_outgoing

      # Timestamps
      t.datetime  :sent_at
      t.timestamp :created_at
      t.timestamp :deleted_at
    end

    add_reference :messages, :match, optional: false
    add_reference :messages, :message, foreign_key: :parent_id, optional: true
  end
end
