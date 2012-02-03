module Airbrake
  class << self

    def notify_with_statds(*args)
      Airbrake::Statsd.increment
      notify_without_statsd(*args)
    end

    alias :notify_without_statsd :notify
    alias :notify :notify_with_statds

    def notify_or_ignore_with_statsd(*args)
      Airbrake::Statsd.increment
      notify_or_ignore_without_statsd(*args)
    end

    alias :notify_or_ignore_without_statsd :notify_or_ignore
    alias :notify_or_ignore :notify_or_ignore_with_statsd

  end
end
