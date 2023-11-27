# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "rubygems-generate_index"
  s.version = "1.0.0"
  s.authors = ["Jim Weirich", "Chad Fowler", "Eric Hodel", "Luis Lavena", "Aaron Patterson", "Samuel Giddins", "André Arko", "Evan Phoenix", "Hiroshi SHIBATA"]
  s.email = ["", "", "drbrain@segment7.net", "luislavena@gmail.com", "aaron@tenderlovemaking.com", "segiddins@segiddins.me", "andre@arko.net", "evan@phx.io", "hsbt@ruby-lang.org"]

  s.summary = "Generates the index files for a gem server directory"
  s.homepage = "https://github.com/rubygems/rubygems-generate_index"

  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/rubygems/rubygems-generate_index"
  s.metadata["changelog_uri"] = "https://github.com/rubygems/rubygems-generate_index"

  s.licenses = ["Ruby", "MIT"]

  s.files = File.read("Manifest.txt").split
  s.bindir = "exe"
  s.executables = s.files.grep(%r{\Aexe/}) {|f| File.basename(f) }
  s.require_paths = ["lib"]
  s.rdoc_options = ["--main", "README.md", "--title=RubyGems Generate Index Documentation"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "MIT.txt", "Manifest.txt", "README.md",
    "CODE_OF_CONDUCT.md"
  ]

  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0")
  s.required_rubygems_version = Gem::Requirement.new(">= 0")

  s.add_dependency "compact_index", "~> 0.14.0"
end
