require 'airbrake'
require 'statsd'

require 'airbrake-statsd/version'
require 'airbrake-statsd/configuration'
require 'airbrake-statsd/airbrake_ext'

module Airbrake
  module Statsd
    class << self

      def configure(&block)
        @configured = true
        block.call(config) if block_given?
      end

      def configured?
        !!@configured
      end

      def config
        @config ||= Configuration.new
      end

      def client
        @client ||= begin
          client = ::Statsd.new(config.host, config.port)
          client.namespace = config.namespace if config.namespace
          client
        end
      end

      def increment
        return unless configured?
        client.increment(config.bucket)
      end

    end # << self
  end # Statsd
end # Airbrake
