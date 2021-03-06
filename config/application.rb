require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Yacitaku
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    #タイムゾーン設定を東京に
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # サービスをオートロードする(サービスクラスの追加を試してみる)……本番環境では上でないとだめなはず
    config.eager_load_paths += %W( #{config.root}/extras )

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
