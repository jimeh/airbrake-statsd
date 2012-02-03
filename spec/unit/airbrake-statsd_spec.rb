require 'spec_helper'

module Airbrake
  describe Statsd do

    subject { Statsd }

    before do
      subject.instance_variable_set('@configured', nil)
      subject.instance_variable_set('@config', nil)
      subject.instance_variable_set('@client', nil)
    end

    describe '#configured?' do
      context 'when #configure has been called' do
        it 'returns true' do
          subject.configure
          subject.configured?.should be_true
        end
      end # configure called

      context 'when #configure has not been called' do
        it 'returns false' do
          subject.configured?.should be_false
        end
      end # configure not called
    end # configured?

    describe '#config' do
      it 'creates new Configuration instance if not set' do
        subject.config.should be_a(Statsd::Configuration)
      end
    end

    describe '#client' do
      it 'creates a new ::Statsd client instance if not set' do
        subject.config.should_receive(:host).once.and_return('testhost')
        subject.config.should_receive(:port).once.and_return(1234)
        ::Statsd.should_receive(:new).with('testhost', 1234)
        subject.client
      end

      context 'when a namespace is set in #config instance' do
        before do
          subject.configure { |config| config.namespace = 'test' }
        end

        it 'sets namespace on client' do
          ::Statsd.any_instance.should_receive(:namespace=).with('test').once
          subject.client
        end
      end
    end

    describe '#increment' do
      context 'when #configure has been called' do
        before { subject.configure }

        it 'calls #increment on #client instance' do
          subject.client.should_receive(:increment).once
          subject.increment
        end

        it 'default bucket name used is "exceptions"' do
          subject.client.should_receive(:increment).with('exceptions').once
          subject.increment
        end
      end # configure called
    end # increment

  end
end
