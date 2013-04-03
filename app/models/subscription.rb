class Subscription < ActiveRecord::Base
  attr_accessible :name, :url

  belongs_to :user
  has_many :feed_entries
end
