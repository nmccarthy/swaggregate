desc "This task is called by the Heroku scheduler add-on"
task :update_feeds => :environment do
    Subscription.update_subscriptions
end