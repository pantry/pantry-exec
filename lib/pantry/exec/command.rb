module Pantry
  module Exec
    # Execute a Shell command, returning STDOUT, STDERR, and the status code.
    # Executes as the user the Pantry Client is running under.
    class Command < Pantry::Command

      command "exec COMMAND [ARGUMENTS]" do
        description "
          Run the given COMMAND (and its ARGUMENTS) on the chosen Pantry Clients.
        "
      end

      def initialize(*command_and_args)
        @command_and_args = command_and_args
      end

      def to_message
        message = super
        message << @command_and_args
        message
      end

      def perform(message)
        command_and_args       = message.body[0]
        stdout, stderr, status = Open3.capture3(*command_and_args)
        [stdout, stderr, status.to_i]
      end

      def receive_client_response(response)
        stdout, stderr, status = response.body
        Pantry.ui.say("From #{response.from}")
        Pantry.ui.say(stdout)
        Pantry.ui.say(stderr)
      end

    end
  end
end
