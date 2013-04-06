desc "This task is called by the Heroku scheduler add-on"
task :update_feeds => :environment do
    Subscription.update_subscriptions
end

# task :send_reminders => :environment do
#     User.send_reminders
# end