desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  Bot.ocs_mentions
  Bot.orlando_soccer
  Bot.make_it_count
end

