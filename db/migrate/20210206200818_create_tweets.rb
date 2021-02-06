class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :message
      t.references :user, foreign_key: false

      t.timestamps
    end
  end
end
