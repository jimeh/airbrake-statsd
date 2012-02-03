require 'spec_helper'

describe Airbrake do

  subject { Airbrake }

  it '#notify is an alias to #notify_with_statsd' do
    subject.method(:notify).should == subject.method(:notify_with_statds)
  end

  it '#notify_or_ignore is an alias to #notify_or_ignore_with_statsd' do
    subject.method(:notify_or_ignore).
      should == subject.method(:notify_or_ignore_with_statsd)
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

  describe '#notify_or_ignore_without_statsd' do
    it 'does not call Airbrake::Statsd.increment' do
      Airbrake.stub(:send_notice).and_return(nil)

      Airbrake.should_receive(:build_notice_for).with('oops', {}).
        and_return(mock('Notice', :ignore? => false))
      Airbrake::Statsd.should_not_receive(:increment)

      Airbrake.notify_or_ignore_without_statsd('oops', {})
    end
  end

  describe '#notify_or_ignore' do
    it 'calls Airbrake::Statsd.increment' do
      Airbrake.stub(:send_notice).and_return(nil)

      Airbrake.should_receive(:build_notice_for).with('oops', {}).
        and_return(mock('Notice', :ignore? => false))
      Airbrake::Statsd.should_receive(:increment)

      Airbrake.notify_or_ignore('oops', {})
    end
  end

end
