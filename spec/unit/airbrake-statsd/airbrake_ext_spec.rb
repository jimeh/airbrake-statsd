require 'spec_helper'

describe Airbrake do

  subject { Airbrake }

  it '#notify is an alias to #notify_with_statsd' do
    subject.method(:notify).should == subject.method(:notify_with_statds)
  end

  describe '#notify_without_statsd' do

    it 'does not call Airbrake::Statsd.increment' do
      Airbrake.stub(:send_notice).and_return(nil)

      Airbrake.should_receive(:build_notice_for).with('oops', {})
      Airbrake::Statsd.should_not_receive(:increment)

      Airbrake.notify_without_statsd('oops', {})
    end
  end

  describe '#notify' do
    it 'calls Airbrake::Statsd.increment' do
      Airbrake.stub(:send_notice).and_return(nil)

      Airbrake.should_receive(:build_notice_for).with('oops', {})
      Airbrake::Statsd.should_receive(:increment)

      Airbrake.notify('oops', {})
    end
  end

end
