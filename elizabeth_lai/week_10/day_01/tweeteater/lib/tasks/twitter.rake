namespace :twitter do
  desc "Removes all users"
  task :clear => :environment do
    User.destroy_all
    Tweet.destroy_all
    Rake::Task['twitter:stats'].invoke
  end

  task :stats => :environment do
    puts "Users: #{ User.count }, Tweets: #{ Tweet.count }"
  end

  desc "Populates the Tweet and User tables with Faker data"
  task :populate, [:user_count] => :environment do |t, args| #passing through an array of parameters. t,args is instead of ENV . TO make sure rails has loaded completely first, inc models, include :environment
    #puts "creating #{ args[:user_count] } users"
    args[:user_count].to_i.times do
      user = User.create :email => Faker::Internet.email
      rand(1..50).times do #determines how many tweets we will create
        user.tweets.create :content => Faker::Lovecraft.sentence # equivalent to Tweet.create however it will also include USER ID. Saying go into the user we have created and create tweets for that user.
      end
    end
    Rake::Task['twitter:stats'].invoke
  end

  desc "Populates Tweet table with real live data from Twitter"
  task :search, [:query, :count] => :environment do |t, args|
    puts "searching twitter for #{args[:count] } tweets mentioning #{args[:query] }"
    $client.search(args[:query], result_type: "recent").take(args[:count].to_i).collect do |tweet|
      Tweet.create :content => tweet.text
    end
  end
end

# rake twitter:populate[5] on COMMAND LINE
