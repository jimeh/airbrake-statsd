module Airbrake
  class << self

    private

    def send_notice_with_statsd(*args)
      Airbrake::Statsd.increment
      send_notice_without_statsd(*args)
    end

    alias :send_notice_without_statsd :send_notice
    alias :send_notice :send_notice_with_statsd

  end
end
