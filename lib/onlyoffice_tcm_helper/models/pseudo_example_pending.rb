# frozen_string_literal: true

require_relative 'sub_elements/executing_result_pending'

# class is describe object like RSpec::Core::Example with pending result
class PseudoExamplePending < PseudoExample
  def initialize(description)
    super
    @execution_result = ExecutingResultPending.new
  end

  def pending?
    true
  end
end
