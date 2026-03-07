# frozen_string_literal: true

require_relative "helper"
require "rubygems/indexer"
require "rubygems/commands/generate_index_command"

class TestGemCommandsGenerateIndexCommand < Gem::TestCase
  def setup
    super

    @cmd = Gem::Commands::GenerateIndexCommand.new
    @cmd.options[:directory] = @gemhome
  end

  def test_execute
    use_ui @ui do
      @cmd.execute
    end

    specs = File.join @gemhome, "specs.4.8.gz"

    assert File.exist?(specs), specs
  end

  def test_execute_no_modern
    @cmd.options[:modern] = false

    use_ui @ui do
      @cmd.execute
    end

    specs = File.join @gemhome, "specs.4.8.gz"

    assert File.exist?(specs), specs
  end

  def test_handle_options_directory
    return if Gem.win_platform?
    refute_equal "/nonexistent", @cmd.options[:directory]

    @cmd.handle_options %w[--directory /nonexistent]

    assert_equal "/nonexistent", @cmd.options[:directory]
  end

  def test_handle_options_directory_windows
    return unless Gem.win_platform?

    refute_equal "/nonexistent", @cmd.options[:directory]

    @cmd.handle_options %w[--directory C:/nonexistent]

    assert_equal "C:/nonexistent", @cmd.options[:directory]
  end

  def test_handle_options_update
    @cmd.handle_options %w[--update]

    assert @cmd.options[:update]
  end

  def test_handle_options_modern
    @cmd.handle_options %w[--modern]

    assert @cmd.options[:build_modern]
  end

  def test_handle_options_no_modern
    @cmd.handle_options %w[--no-modern]

    refute @cmd.options[:build_modern]
  end

  def test_execute_compact_only
    @cmd.options[:build_modern] = false
    @cmd.options[:build_compact] = true

    use_ui @ui do
      @cmd.execute
    end

    names = File.join @gemhome, "names"
    assert File.exist?(names), names

    versions = File.join @gemhome, "versions"
    assert File.exist?(versions), versions

    specs = File.join @gemhome, "specs.4.8.gz"
    refute File.exist?(specs), specs
  end

  def test_execute_no_modern_no_compact
    @cmd.options[:build_modern] = false
    @cmd.options[:build_compact] = false

    assert_raise Gem::MockGemUi::TermError do
      use_ui @ui do
        @cmd.execute
      end
    end

    assert_match(/At least one of --modern or --compact must be enabled/, @ui.error)
  end
end
