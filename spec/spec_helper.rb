# frozen_string_literal: true

$LOAD_PATH << __dir__ + '/../lib'

require 'sequel'

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.expose_dsl_globally = false
  config.filter_gems_from_backtrace 'sequel'
  config.order = :random
end
