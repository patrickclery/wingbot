class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.boolean :is_email_verified
      t.boolean :is_active
      t.string :email
      t.string :name
      t.string :phone_number
      t.string :tinder_id
      t.timestamps
    end
  end
end
