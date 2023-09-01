# frozen_string_literal: true

require_relative 'lib/onlyoffice_tcm_helper/name'
require_relative 'lib/onlyoffice_tcm_helper/version'

Gem::Specification.new do |s|
  s.name = OnlyofficeTcmHelper::NAME
  s.version = OnlyofficeTcmHelper::VERSION
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 3.0'
  s.authors = ['ONLYOFFICE', 'Dmitry Rotaty', 'Pavel Lobashov']
  s.email = %w[shockwavenn@gmail.com]
  s.summary = 'It is helper for work with tcm systems'
  s.description = 'It is helper for work with tcm systems, used in QA'
  s.homepage = "https://github.com/ONLYOFFICE-QA/#{s.name}"
  s.metadata = {
    'bug_tracker_uri' => "#{s.homepage}/issues",
    'changelog_uri' => "#{s.homepage}/blob/master/CHANGELOG.md",
    'documentation_uri' => "https://www.rubydoc.info/gems/#{s.name}",
    'homepage_uri' => s.homepage,
    'source_code_uri' => s.homepage,
    'rubygems_mfa_required' => 'true'
  }
  s.files = Dir['lib/**/*']
  s.license = 'AGPL-3.0'
  s.add_runtime_dependency('onlyoffice_file_helper', '< 2')
end
