class FeedEntry < ActiveRecord::Base
  require 'readability'
  
  attr_accessible :published_date, :remote_entry_id, :summary, :title, :url

  belongs_to :subscription

  def self.update_from_feed(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries)
  end

  private

  def self.add_entries(entries)
    entries.each do |entry|
      unless exists? :remote_entry_id => entry.id
        create!(
          :title            => entry.title,
          :summary          => entry.summary,
          :url              => entry.url,
          :published_date   => entry.published,
          :remote_entry_id  => entry.id
        )
        Readability.test
      end
    end
  end
end