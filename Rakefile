# frozen_string_literal: true

task :lint do
  system 'bundle exec rubocop'
end

task :test do
  system 'bundle exec rspec -r./spec/spec_helper spec/lucid_sql'
end

task default: :test
