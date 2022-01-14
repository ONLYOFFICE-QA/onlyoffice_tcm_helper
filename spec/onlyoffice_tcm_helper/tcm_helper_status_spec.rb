# frozen_string_literal: true

RSpec.describe OnlyofficeTcmHelper::TcmHelper, '#status' do
  describe 'Check statuses' do
    tcm_helper = described_class.new(product_name: 'Product',
                                     plan_name: 'Plan',
                                     suite_name: description)

    it 'Check getting passed status' do
      expect(tcm_helper.parse(PseudoExamplePassed.new('Check getting passed status')).status).to eq(:passed)
    end

    it 'Check getting passed_2 status' do
      tcm_helper.parse(PseudoExamplePassed.new('Check getting passed_2 status'))
      pseudo_example = PseudoExamplePassed.new('Check getting passed_2 status')
      expect(tcm_helper.parse(pseudo_example).status).to eq(:passed_2)
    end

    it 'Check getting failed status' do
      expect(tcm_helper.parse(PseudoExampleFailed.new('Check getting failed status')).status).to eq(:failed)
    end

    it 'Check getting aborted status' do
      expect(tcm_helper.parse(PseudoExampleAborted.new('Check getting aborted status')).status).to eq(:aborted)
    end

    it 'Check getting pending status' do
      expect(tcm_helper.parse(PseudoExamplePending.new('Check getting pending status')).status).to eq(:pending)
    end

    it 'Check getting service_unavailable status' do
      expect(tcm_helper.parse(
        PseudoExampleServiceUnavailable.new('Check getting service_unavailable status')
      ).status).to eq(:service_unavailable)
    end

    it 'Check getting lpv status' do
      expect(tcm_helper.parse(
        PseudoExampleLPV.new('Check getting service_unavailable status')
      ).status).to eq(:lpv)
    end

    it 'Check that PendingButPassed status is failure' do
      expect(tcm_helper.parse(PseudoExamplePendingButPassed.new('PendingButPassed test')).status).to eq(:failed)
    end
  end
end
