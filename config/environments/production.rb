OpenDSA::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  config.hosts << "opendsa-staging.cs.vt.edu"
  config.hosts << "opendsa-server.cs.vt.edu"
  config.hosts << "opendsax.cs.vt.edu"
  config.hosts << "opendsa.org"

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both thread web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Enable Rack::Cache to put a simple HTTP cache in front of your application
  # Add `rack-cache` to your Gemfile before enabling this.
  # For large-scale production use, consider using a caching reverse proxy like nginx, varnish or squid.
  # config.action_dispatch.rack_cache = true

  # Disable Rails's static asset server (Apache or nginx will already do this).
  config.serve_static_files = false

  # Compress JavaScripts and CSS.
  # config.assets.js_compressor = Uglifier.new(harmony: true)

  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Generate digests for assets URLs.
  config.assets.digest = true

  # Version of your assets, change this if you want to expire all your assets.
  config.assets.version = '1.0'

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Set to :debug to see everything in the log.
  config.log_level = :warn

  config.log_formatter = proc do |severity, datetime, progname, msg|
    if severity == 'DEBUG' && msg.blank?
      ''
    else
      "%s [%s] %s\n" % [
        datetime.strftime('%Y-%m-%d %H:%M:%S'),
        severity,
        String === msg ? msg : msg.inspect,
      ]
    end
  end

  # Prepend all log lines with the following tags.
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups.
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets.
  # application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
  # config.assets.precompile += %w( search.js )

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # Do care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = {:host => ENV['host_url']}

  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    address: ENV['email_address'],
    port: ENV['email_port'],
    domain: ENV['email_domain'],
    authentication: 'plain',
    enable_starttls_auto: true,
    user_name: ENV['email_user_name'],
    password: ENV['email_password'],
  }

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Disable automatic flushing of the log to improve performance.
  # config.autoflush_log = false

  config.middleware.use LogFile::Display
end
