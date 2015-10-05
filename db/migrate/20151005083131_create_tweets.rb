class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.datetime :created
    end
    add_index :tweets, :created
    change_column :tweets, :id, :integer, limit: 8
  end
end
