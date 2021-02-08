class AddCounterCachesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :tweets_count,    :bigint
    add_column :users, :followers_count, :bigint
    add_column :users, :following_count, :bigint
  end
end
