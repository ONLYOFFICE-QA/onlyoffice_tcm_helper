# frozen_string_literal: true

require_relative 'sub_elements/executing_result_pending'

# class is describe object like RSpec::Core::Example with pending result
class PseudoExamplePendingButPassed < PseudoExample
  def initialize(description)
    super(description)
    @execution_result = ExecutingResultPending.new(pending_message:
                                                   "Expected pending 'Fake failure' to fail. No error was raised.")
  end

  def pending?
    true
  end
end
