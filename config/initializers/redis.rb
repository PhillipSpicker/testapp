if Rails.env.production?
  uri = URI.parse(ENV["REDISTOGO_URL"])
  REDIS = Redis.new(:url => uri)
else
  $redis = Redis.new(:host => 'localhost', :port => 6379)
end