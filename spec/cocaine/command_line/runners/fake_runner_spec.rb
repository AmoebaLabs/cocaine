require 'spec_helper'

describe Cocaine::CommandLine::FakeRunner do
  it 'records commands' do
    subject.call("some command", :environment)
    subject.call("other command", :other_environment)
    subject.commands.should eq [["some command", :environment], ["other command", :other_environment]]
  end

  it 'can tell if a command was run' do
    subject.call("some command", :environment)
    subject.call("other command", :other_environment)
    subject.ran?("some command").should be_true
    subject.ran?("no command").should be_false
  end

  it 'can tell if a command was run even if shell options were set' do
    subject.call("something 2>/dev/null", :environment)
    subject.ran?("something").should be_true
  end

end
