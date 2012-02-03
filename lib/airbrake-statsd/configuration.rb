module Airbrake
  module Statsd
    class Configuration

      attr_accessor :namespace

      def host
        @host ||= 'localhost'
      end
      attr_writer :host

      def port
        @port ||= 8125
      end
      attr_writer :port

      def bucket
        @bucket ||= 'exceptions'
      end
      attr_writer :bucket

    end # Configuration
  end # Statsd
end # Airbrake
