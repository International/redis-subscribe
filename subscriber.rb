require "rubygems"
require "bundler"

Bundler.require(:default)

# trigger a message with redis-cli
# publish channel message
# ex: publish general-notif hello
redis = Redis.new
puts "Created"
redis.subscribe "general-notif" do |on|
  puts "Subscribed"
  on.message do |channel,msg|
    puts "Received #{msg} on #{channel}"
  end
end
