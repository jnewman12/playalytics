# encoding: utf-8
# This file is distributed under New Relic's license terms.
# See https://github.com/newrelic/rpm/blob/master/LICENSE for complete details.

require 'action_controller/railtie'
require 'active_model'
require 'rails/test_help'

# We define our single Rails application here, one time, upon the first inclusion
# Tests should feel free to define their own Controllers locally, but if they
# need anything special at the Application level, put it here
if !defined?(MyApp)

  ENV['NEW_RELIC_DISPATCHER'] = 'test'

  class NamedMiddleware
    def initialize(app, options={})
      @app = app
    end

    def call(env)
      status, headers, body = @app.call(env)
      headers['NamedMiddleware'] = '1'
      [status, headers, body]
    end
  end

  class InstanceMiddleware
    attr_reader :name

    def initialize
      @app  = nil
      @name = 'InstanceMiddleware'
    end

    # Yes, this is nuts. See the comment above initialize_with_new_relic_trace.
    def new(app)
      @app = app
      self
    end

    def call(env)
      status, headers, body = @app.call(env)
      headers['InstanceMiddleware'] = '1'
      [status, headers, body]
    end
  end

  class MyApp < Rails::Application
    # We need a secret token for session, cookies, etc.
    config.active_support.deprecation = :log
    config.secret_token = "49837489qkuweoiuoqwehisuakshdjksadhaisdy78o34y138974xyqp9rmye8yrpiokeuioqwzyoiuxftoyqiuxrhm3iou1hrzmjk"
    config.eager_load = false
    config.filter_parameters += [:secret]
    initializer "install_error_middleware" do
      config.middleware.use ErrorMiddleware
    end
    initializer "install_middleware_by_name" do
      config.middleware.use "NamedMiddleware"
    end
    initializer "install_middleware_instance" do
      config.middleware.use InstanceMiddleware.new
    end
  end
  MyApp.initialize!

  MyApp.routes.draw do
    get('/bad_route' => 'test#controller_error',
        :constraints => lambda do |_|
          raise ActionController::RoutingError.new('this is an uncaught routing error')
        end)
    get '/:controller(/:action(/:id))'
  end

  class ApplicationController < ActionController::Base; end
end
