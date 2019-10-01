redis_config = {
	url: $redis.redis.connection[:id],
	namespace: $redis.namespace
}

Sidekiq.configure_server do |config|
  config.redis = redis_config
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end