# frozen_string_literal: true

module OnlyofficeTcmHelper
  # module with methods for parsing test results
  module PendingHelper
    # Check if pending example passed
    # This situation is incorrect - if pending is passing for some reason
    # This pending comment should be removed and investigate
    # @param [String] comment of example
    # @return [Boolean]
    def pending_passed?(comment)
      comment.match?(/Expected pending.*to fail/)
    end

    # Get pending status by it's comment
    # @param [String] comment of example
    # @return [Symbol] `:failed` or `:pending`
    def pending_status(comment)
      if pending_passed?(comment)
        :failed
      else
        :pending
      end
    end

    # Handle pending information
    # @param [RSpec::Core::Example] example to handle
    # @retunr [Symbol] status of pending
    def handle_pending(example)
      @comment = example.execution_result.pending_message

      pending_status(@comment)
    end
  end
end
