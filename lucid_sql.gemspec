# frozen_string_literal: true

$LOAD_PATH.unshift "#{__dir__}/lib"

require 'lucid_sql/version'

Gem::Specification.new do |s|
  s.add_development_dependency 'rake', '~> 12.3'
  s.add_development_dependency 'rspec', '~> 3.6'
  s.add_development_dependency 'rubocop', '0.52.0'
  s.add_development_dependency 'sequel', '~> 5.10'
  s.author = 'Kelsey Judson'
  s.email = 'kelsey@lucid.nz'
  s.files = Dir.glob('lib/**/*') + %w[README.md]
  s.homepage = 'https://github.com/lucidnz/gem-lucid_sql'
  s.license = 'ISC'
  s.name = 'lucid_sql'
  s.summary = 'Read SQL statements from files'
  s.version = LucidSQL::VERSION
end
