class CreateMessageAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :message_attachments do |t|
      t.string :attachment
      t.references :message, foreign_key: true

      t.timestamps
    end
  end
end
