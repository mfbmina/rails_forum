class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :subject
      t.references :user, index: true

      t.timestamps
    end
  end
end
