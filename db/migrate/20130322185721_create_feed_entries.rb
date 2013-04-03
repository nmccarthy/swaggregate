class CreateFeedEntries < ActiveRecord::Migration
  def change
    create_table :feed_entries do |t|
      t.string :title
      t.text :summary
      t.datetime :published_date
      t.string :url
      t.string :remote_entry_id
      t.integer :subscription_id

      t.timestamps
    end
  end
end
