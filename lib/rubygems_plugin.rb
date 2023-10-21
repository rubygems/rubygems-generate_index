# frozen_string_literal: true

require "rubygems/command_manager"
require_relative "rubygems/commands/generate_index_command"

Gem::CommandManager.instance.register_command :generate_index
