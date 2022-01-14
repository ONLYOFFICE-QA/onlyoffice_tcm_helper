# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  enable_coverage :branch
end

require 'bundler/setup'
require 'onlyoffice_tcm_helper'
require_relative '../lib/onlyoffice_tcm_helper/models/pseudo_example'
require_relative '../lib/onlyoffice_tcm_helper/models/pseudo_example_passed'
require_relative '../lib/onlyoffice_tcm_helper/models/pseudo_example_failed'
require_relative '../lib/onlyoffice_tcm_helper/models/pseudo_example_aborted'
require_relative '../lib/onlyoffice_tcm_helper/models/pseudo_example_pending'
require_relative '../lib/onlyoffice_tcm_helper/models/pseudo_example_pending_but_passed'
require_relative '../lib/onlyoffice_tcm_helper/models/pseudo_example_service_unavailable'
require_relative '../lib/onlyoffice_tcm_helper/models/pseudo_example_lpv'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
