# frozen_string_literal: true

# class is describe same RSpec::Core::Example::ExecutingResult with pending status
class ExecutingResultPending
  attr_reader :started_at, :pending_message

  def initialize(pending_message: 'Pending exception')
    @started_at = Time.now
    @pending_message = pending_message
  end
end
