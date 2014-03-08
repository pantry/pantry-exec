##
# Hook this plugin into Pantry.
##
require 'open3'
require 'pantry/exec/command'

Pantry.add_client_command(Pantry::Exec::Command)
