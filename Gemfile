# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in rubygems-generate_index.gemspec
gemspec

gem "rake", "~> 13.0"
gem "rubocop", "~> 1.21"
gem "rubocop-performance", "~> 1.19"
gem "rubocop-rake", "~> 0.6.0"
gem "test-unit", "~> 3.0"

install_if -> { Gem::VERSION < "3.2.0" } do
  gem "builder", "~> 3.2"
end
