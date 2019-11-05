class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages, force: :cascade do |t|
      t.text :content
      t.string :tinder_message_id
      t.boolean :is_outgoing
      t.integer :parent_id

      # Timestamps
      t.datetime :sent_at
      t.timestamp :created_at
      t.timestamp :deleted_at

      t.references :match, optional: false
      t.references :message, foreign_key: 'parent_id', optional: true
    end

  end
end
