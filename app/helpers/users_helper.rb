module UsersHelper
  def fetch_users
    users = $redis.get("users")
    if users.nil?
      users = User.all.to_json
      $redis.set("users", users)
      # Expire the cache, every 5 hours
      $redis.expire("users",5.hour.to_i)
    end
    @users = JSON.load users
  end
end
