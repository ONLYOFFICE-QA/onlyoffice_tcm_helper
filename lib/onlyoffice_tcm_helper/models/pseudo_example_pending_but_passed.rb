# frozen_string_literal: true

require_relative 'sub_elements/executing_result_pending'

# class is describe object like RSpec::Core::Example with pending result
class PseudoExamplePendingButPassed < PseudoExample
  def initialize(description)
    super(description)
    @execution_result = ExecutingResultPending.new(pending_message:
                                                   "Expected pending 'Fake failure' to fail. No error was raised.")
  end

  # @return [True] this example always pending
  def pending?
    true
  end

  # @return [String] exception data
  def exception
    'Expected example to fail since it is pending, but it passed.'
  end
end
