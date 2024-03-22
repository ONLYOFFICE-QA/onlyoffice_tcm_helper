# frozen_string_literal: true

RSpec.describe OnlyofficeTcmHelper::TcmHelper, '#comment' do
  describe 'Check comments' do
    tcm_helper = described_class.new(product_name: 'Product',
                                     plan_name: 'Plan',
                                     suite_name: description)
    it 'check comment for passed status' do
      expect(tcm_helper.parse(PseudoExamplePassed.new('check comment for passed status')).comment).to eq("\nOk")
    end

    it 'check comment for passed_2 status' do
      tcm_helper.parse(PseudoExamplePassed.new('check comment for passed_2 status'))
      expect(tcm_helper.parse(PseudoExamplePassed.new('check comment for passed_2 status')).comment).to eq("\nPassed 2")
    end

    it 'check comment for failed status' do
      failure = "Cannot find failed line because of exception: undefined method ['`]backtrace'"
      example = PseudoExampleFailed.new('check comment for passed_2 status')
      expect(tcm_helper.parse(example).comment).to match(/#{failure}/)
    end

    it 'check comment for aborted status' do
      expect(tcm_helper.parse(PseudoExampleAborted.new('check comment for aborted status')).comment).not_to be_empty
    end

    it 'check comment for pending status' do
      expect(tcm_helper.parse(PseudoExamplePending.new('check comment for pending status'))
                       .comment).to eq('Pending exception')
    end

    it 'check comment for service_unavailable status' do
      expect(tcm_helper.parse(PseudoExampleServiceUnavailable.new('check comment for service_unavailable status'))
                       .comment).to eq("\nService Unavailable: 503")
    end

    it 'check comment for lpv status' do
      expect(tcm_helper.parse(PseudoExampleLPV.new('check comment for lpv status'))
                       .comment).to eq("\nLimited program version")
    end

    it 'check comment for failed line' do
      expect(tcm_helper.parse(PseudoExampleFailed.new('check comment for lpv status',
                                                      exception_with_failed_lines: true))
                       .comment).to include('RSpec.describe OnlyofficeTcmHelper do')
    end
  end
end
