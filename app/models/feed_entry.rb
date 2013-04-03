class FeedEntry < ActiveRecord::Base
  attr_accessible :published_date, :remote_entry_id, :summary, :title, :url

  belongs_to :subscription

  def self.update_from_feed(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries)
  end

  def self.update_from_feed_continuously(feed_url, delay_interval = 15.minutes)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries)
    loop do
      sleep delay_interval
      feed = Feedzirra::Feed.update(feed)
      add_entries(feed.new_entries) if feed.updated?
    end
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
      end
    end
  end
end