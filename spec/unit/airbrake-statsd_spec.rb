require 'spec_helper'

module Airbrake
  describe Statsd do

    subject { Statsd }

    before do
      ['@configured', '@config', '@client'].each do |var_name|
        subject.instance_variable_set(var_name, nil)
      end
    end

    describe '#configure' do
      it 'sets @configured to true' do
        subject.instance_variable_get('@configured').should_not be_true
        subject.configure
        subject.instance_variable_get('@configured').should be_true
      end

      context 'when block is passed' do
        it 'passes #config to block' do
          block = Proc.new { |conf| conf.should be_a(Statsd::Configuration) }
          subject.configure(&block)
        end
      end # block passed
    end # configure

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
    end # config

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
      end # namespace is set
    end # client

    describe '#increment' do
      context 'when #configure has been called' do
        before { subject.configure }

        it 'calls #increment on #client' do
          subject.client.should_receive(:increment).with('exceptions').once
          subject.increment
        end

        context 'when bucket option has been customized' do
          before do
            subject.configure { |config| config.bucket = 'errors' }
          end

          it 'calls #increment on #client with custom bucket' do
            subject.client.should_receive(:increment).with('errors').once
            subject.increment
          end
        end # bucket option customized
      end # configure called

      context 'when #configure has not been called' do
        it 'does not call #increment on #client' do
          subject.client.should_not_receive(:increment)
          subject.increment
        end
      end # configure not called
    end # increment

  end
end
