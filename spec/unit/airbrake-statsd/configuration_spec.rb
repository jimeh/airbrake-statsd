require 'spec_helper'

module Airbrake
  module Statsd
    describe Configuration do

      describe '`host` option' do
        it 'defaults to "localhost"' do
          subject.host.should == 'localhost'
        end

        it 'can be set' do
          subject.host = 'not-default.com'
          subject.host.should == 'not-default.com'
        end
      end

      describe '`port` option' do
        it 'defaults to 8125' do
          subject.port.should == 8125
        end

        it 'can be set' do
          subject.port = 88125
          subject.port.should == 88125
        end
      end

      describe '`namespace` option' do
        it 'defaults to "nil"' do
          subject.namespace.should be_nil
        end

        it 'can be set' do
          subject.namespace = 'my_awesome_app'
          subject.namespace.should == 'my_awesome_app'
        end
      end

    end
  end
end
