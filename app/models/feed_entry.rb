class FeedEntry < ActiveRecord::Base
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
          :title            => entry.title.sanitize,
          :summary          => entry.summary.sanitize,
          :url              => entry.url.sanitize,
          :published_date   => entry.published.sanitize,
          :remote_entry_id  => entry.id.sanitize
        )
      end
    end
  end
end