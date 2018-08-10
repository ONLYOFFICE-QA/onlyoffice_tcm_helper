require_relative 'sub_elements/ExecutingResultPending'

# class is describe object like RSpec::Core::Example with pending result
class PseudoExamplePending < PseudoExample
  def initialize(description)
    super(description)
    @execution_result = ExecutingResultPending.new
  end

  def pending?
    true
  end
end