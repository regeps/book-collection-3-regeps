require "active_support/core_ext/integer/time"

Rails.application.configure do
  # ✅ Make staging behave like production but allow more debugging
  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = true # Show full error reports in staging
  config.action_controller.perform_caching = true

  # ✅ Use same cache settings as production
  config.public_file_server.headers = { "cache-control" => "public, max-age=#{1.year.to_i}" }
  config.active_storage.service = :local
  config.assume_ssl = true
  config.force_ssl = true
  config.log_tags = [:request_id]
  config.logger = ActiveSupport::TaggedLogging.logger(STDOUT)
  config.log_level = "debug" # Allow more logs for debugging staging

  # ✅ Fix database connection
  config.active_record.dump_schema_after_migration = false
  config.active_record.database_selector = { delay: 2.seconds }
  config.active_record.database_resolver = ActiveRecord::Middleware::DatabaseSelector::Resolver
  config.active_record.database_resolver_context = ActiveRecord::Middleware::DatabaseSelector::Resolver::Session
end
