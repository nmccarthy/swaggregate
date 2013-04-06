class Subscription < ActiveRecord::Base
  attr_accessible :name, :url

  belongs_to :user
  has_many :feed_entries

  def self.update_subscriptions
    subscriptions = Subscription.all
    subscriptions.each do |subscription|
      FeedEntry.update_from_feed(subscription.url)
    end
  end

end
