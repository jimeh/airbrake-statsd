# Airbrake-Statsd

[![Build Status](https://secure.travis-ci.org/jimeh/airbrake-statsd.png)](http://travis-ci.org/jimeh/airbrake-statsd)

Extends the [Airbrake][] gem to also report exceptions Esty's [Statsd][]
statistics aggregator.

## Installation

    gem install airbrake-statsd

## Usage

It's assumed you know what both Airbrake and StatsD are before attempting to
use this gem. If you don't, come back when you do know :)

All that's needed is to require `airbrake-statsd` and call
`Airbrake::Statsd.configure` and Airbrake notifications will automatically be
sent to StatsD and Airbrake.

```ruby
require 'airbrake'
require 'airbrake-statsd'

Airbrake::Statsd.configure do |config|
  config.host = 'my-statsd-server'
  config.port = 8125
  config.namespace = 'my_awesome_app'
end

Airbrake.notify({})
```

## Credit & Thanks

* [Global Personals][gp] for hosting a hack day.

## License and Copyright

Copyright (c) 2012 Jim Myhrberg & Global Personals, Ltd.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


[airbrake]: http://airbrake.io/
[statsd]: https://github.com/etsy/statsd
[gp]: http://globalpersonals.co.uk/
