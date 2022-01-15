# frozen_string_literal: true

module OnlyofficeTcmHelper
  # module with methods for parsing test results
  module PendingHelper
    # Check if pending example passed
    # This situation is incorrect - if pending is passing for some reason
    # This pending comment should be removed and investigate
    # @param [String] exception text of example
    # @return [Boolean]
    def pending_passed?(exception)
      exception.start_with?('Expected example to fail since it is pending, but it passed')
    end

    # Get pending status by it's comment
    # @param [String] exception text of example
    # @return [Symbol] `:failed` or `:pending`
    def pending_status(exception)
      if pending_passed?(exception)
        :failed
      else
        :pending
      end
    end

    # Handle pending information
    # @param [RSpec::Core::Example] example to handle
    # @return [Symbol] status of pending
    def handle_pending(example)
      @comment = example.execution_result.pending_message
      exception = example.exception.to_s

      pending_status(exception)
    end
  end
end
