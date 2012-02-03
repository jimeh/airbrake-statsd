require 'spec_helper'

describe Airbrake do

  subject { Airbrake }

  let(:notice) { mock('Notice', :to_xml => '') }
  let(:configuration) { mock('Configuration', :public? => true) }

  let(:sender) do
    sender = mock('Sender')
    sender.stub(:send_to_airbrake)
    sender
  end

  describe '#send_notice_without_statsd' do
    before do
      Airbrake.stub(:configuration).and_return(configuration)
      Airbrake.stub(:sender).and_return(sender)
    end

    it 'does not call Airbrake::Statsd.increment' do
      Airbrake::Statsd.should_not_receive(:increment)
      Airbrake.send(:send_notice_without_statsd, notice)
    end
  end

  describe '#send_notice' do
    it 'calls Airbrake::Statsd.increment' do
      Airbrake::Statsd.should_receive(:increment)
      Airbrake.should_receive(:send_notice_without_statsd)

      Airbrake.send(:send_notice, notice)
    end
  end

end
