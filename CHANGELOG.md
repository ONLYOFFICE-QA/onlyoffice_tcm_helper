# Change log

## Unreleased (master)

### New Features

* Add `yamllint` check in CI

### Fixes

* Fix `markdownlint` failure because of old `nodejs` in CI

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
