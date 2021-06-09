require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BookTrade
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    
    # rails6よりセキュリティの観点からホスト名を以下の様にホワイトリストに設定しなければローカルサーバに繋がらない(development環境のみ)
    config.hosts << "99f03a8afc064b46b8c98f2238412383.vfs.cloud9.us-east-1.amazonaws.com"
  end
end
