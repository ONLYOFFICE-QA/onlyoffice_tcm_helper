# frozen_string_literal: true

require 'onlyoffice_tcm_helper/helpers/pending_helper'
require 'onlyoffice_tcm_helper/helpers/rspec_helper'
require 'onlyoffice_tcm_helper/helpers/time_helper'
require 'onlyoffice_tcm_helper/version'
require 'rspec'
require 'socket'
require 'json'

# namespace for gem
module OnlyofficeTcmHelper
  # Class for generate data for result by RSpec::Core::Example
  class TcmHelper
    include PendingHelper
    include TimeHelper
    include RspecHelper
    # @return [Symbol] one of status: passed, passed_2, failed, aborted, pending, service_unavailable, lpv
    attr_accessor :status
    # @return [String] name of case(or name of result_set)
    attr_reader :case_name
    # @return [RSpec::Core::Example] example - is a returned object in "after" block
    attr_reader :example
    # @return [String] is a comment for result, like a error, link to bug, etc
    attr_reader :comment
    # @return [String] is a name of product
    attr_reader :product_name
    # @return [String] is a name of plan
    attr_reader :plan_name
    # @return [String] is a name of suite(ore run)
    attr_reader :suite_name
    # @return [String] is a name last case, who result has generated
    attr_reader :last_case
    # @return [Hash] is a result message.
    attr_accessor :result_message

    def initialize(params = {})
      @product_name = params[:product_name]
      @plan_name = params[:plan_name]
      @suite_name = params[:suite_name]
    end

    # @param [RSpec::Core::Example] example - is a returned object in "after" block
    # @return [TcmHelper] is object
    def parse(example)
      @case_name = example.metadata[:description]
      get_status_and_comment(example)
      @result_message = get_message_and_custom_fields(example)
      self
    end

    # Get message and custom fields from example
    # @param [Object] example to get
    # @return [String] json data
    def get_message_and_custom_fields(example)
      custom_fields = {}
      custom_fields[:subdescriber] = [
        { title: 'elapsed', value: example_time_in_seconds(example) },
        { title: 'custom_host', value: Socket.gethostname }
      ]
      custom_fields[:describer] = [{ title: 'comment', value: @comment }]
      custom_fields.to_json
    end

    # @param [RSpec::Core::Example] example - is a returned object in "after" block
    # @return [Symbol] is a symbolic name of test status
    def get_status_and_comment(example)
      @status = if result_is_failed?(example)
                  @comment = form_failed_comment(example)
                  :failed
                elsif example.pending?
                  handle_pending(example)
                elsif result_is_passed?(example)
                  @comment = "\nOk"
                  :passed
                elsif result_is_passed2?(example)
                  @comment = "\nPassed 2"
                  :passed_2
                elsif result_is_service_unavailable?(example)
                  @comment = "\n#{example.exception}"
                  :service_unavailable
                elsif result_is_lpv?(example)
                  @comment = "\n#{example.exception}"
                  :lpv
                else
                  @comment = "\n#{example.exception}"
                  :aborted
                end
      @last_case = @case_name
    end

    def result_is_passed?(example)
      example.exception.nil? && @last_case != example.description
    end

    def result_is_passed2?(example)
      example.exception.nil? && @last_case == example.description
    end

    def result_is_failed?(example)
      # return true if example.metadata[:execution_result].pending_fixed
      ['got:', 'expected:', 'to return'].map do |current_error|
        return true if example.exception.to_s.include?(current_error)
      end
      false
    end

    def result_is_service_unavailable?(example)
      example.exception.to_s.include?('Service Unavailable')
    end

    def result_is_lpv?(example)
      example.exception.to_s.include?('Limited program version')
    end

    private

    # Form comment for failed test
    # @param [RSpec::Core::Example] example to parse
    # @return [String] comment
    def form_failed_comment(example)
      failed_line = RspecHelper.find_failed_line(example)
      "\n#{example.exception.to_s
                  .gsub('got:', "got:\n")
                  .gsub('expected:', "expected:\n")
                  .gsub('to return ', "to return:\n")}\n" \
        "In line:\n#{failed_line}"
    end
  end
end
