desc "This task is called by the Heroku scheduler add-on"
task :ocs_mentions => :environment do
  Bot.ocs_mentions
end

task :orlando_soccer => :environment do
  Bot.orlando_soccer
end

task :make_it_count => :environment do
  Bot.make_it_count
end

task :orlando_city_soccer => :environment do
  Bot.orlando_city_soccer
end

task :orlando_city_goal => :environment do
  Bot.orlando_city_goal
end

task :orlando_mls => :environment do
  Bot.orlando_mls
end



