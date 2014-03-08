require 'test_helper'

describe "Executing the shell command on Clients" do
  mock_ui!

  it "asks a client for the output (stdout, stderr, and status) of a given command" do
    set_up_environment(ports_start_at: 11000)

    Pantry::CLI.new(
      %w(-a pantry exec hostname),
      identity: "CLI1"
    ).run

    assert_match %r|#{@client1.identity}\n#{`hostname`.strip}|, stdout
    assert_match %r|#{@client2.identity}\n#{`hostname`.strip}|, stdout
  end
end
