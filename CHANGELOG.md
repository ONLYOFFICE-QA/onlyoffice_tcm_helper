# Change log

## Unreleased (master)

### New Features

* Add `ruby-3.4` to CI

### Changes

* Fix `rubocop-rspec-2.27.0` cop `RSpec/DescribedClass` warnings.
* Fix `rubocop-1.64` cop `Style/SuperArguments` warnings.
* Fix tests compatibility with `ruby-3.4`
* Fix `rubocop-1.65.0` cop `Gemspec/AddRuntimeDependency`
* Remove `ruby-3.0` from CI, since it's EOLed

## 1.0.0 (2024-02-02)

### New Features

* Add `ruby-3.2` to CI
* Add `ruby-3.3` to CI
* Add `dependabot` check for `GitHub Actions`

### Changes

* Drop `ruby-2.7` support, since it's EOL'ed
* Add additional verification to specs
* Reduce some `rubocop` metrics

## 0.4.0 (2022-08-10)

### New Features

* Add `yamllint` check in CI

### Fixes

* Fix `markdownlint` failure because of old `nodejs` in CI

### Changes

* Check `dependabot` at 8:00 Moscow time daily
* Changes from `rubocop-rspec` update to 2.9.0
* Drop `ruby-2.6` support, since it's EOL'ed

## 0.3.2 (2022-01-15)

### Changes

* Add more info to message if pending test passed

## 0.3.1 (2022-01-15)

### Fixes

* Fix check for passed `pending` tests

## 0.3.0 (2022-01-15)

### New Features

* Add `ruby-3.1` in CI
* Mark `:pending` tests that passed as `:failed`

### Changes

* Require `mfa` for releasing gem
* Remove `ruby-2.5` from CI since it's EOLed

## 0.2.0 (2021-01-13)

### New features

* Add `markdownlint` support and check in CI
* Add `simplecov` support to check coverage
* Add coverage check in CI
* Add `rubocop` check to CI
* Add `dependabot` config
* Add CI check that 100% code is documented
* Add `rake` task to release gem

### Changes

* Use GitHub Actions instead of TravisCI
* Drop support of Rubies older than 2.5
* Cleanup gemspec
* Freeze all dependencies version in `Gemfile.lock`
* Add missing documentation
* Remove not used CodeClimate config
* Moved repo to `ONLYOFFICE-QA` org

## 0.1.1

* First known release
