module Airbrake
  class << self

    def notify_with_statds(*args)
      Airbrake::Statsd.increment
      notify_without_statsd(*args)
    end

    alias :notify_without_statsd :notify
    alias :notify :notify_with_statds

  end
end
