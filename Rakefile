# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end
task default: :test

namespace "test" do
  desc "Run each test isolatedly by specifying the relative test file path"
  task "isolated" do
    FileList["test/**/{bundler_,}test_*.rb"].each do |file|
      sh Gem.ruby, "-Ilib:test:bundler/lib", file
    end
  end
end

if RUBY_VERSION >= "2.7"
  require "rubocop/rake_task"

  RuboCop::RakeTask.new

  task default: :rubocop
end

module Rubygems
  class ProjectFiles
    def self.all
      files = []
      exclude = /\A(?:\.|Rakefile|bin|test)/
      tracked_files = `git ls-files -z`.split("\0")

      tracked_files.each do |path|
        next unless File.file?(path)
        next if path&.match?(exclude)
        files << path
      end

      files.sort
    end
  end
end

desc "Update the manifest to reflect what's on disk"
task :update_manifest do
  File.open("Manifest.txt", "w") {|f| f.puts(Rubygems::ProjectFiles.all) }
end

desc "Check the manifest is up to date"
task :check_manifest do
  if File.read("Manifest.txt").split != Rubygems::ProjectFiles.all
    abort "Manifest is out of date. Run `rake update_manifest` to sync it"
  end
end
