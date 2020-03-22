require 'rails_helper'

RSpec.describe Weather::ElTiempo::GetSummary do
  subject { described_class.run!(params) }

  let(:params) {  { localidad: localidad } }
  let(:localidad) { 1234 }
  let(:api_response) { create(:api_response) }
  let(:body) { create(:body) }
  let(:data) { create(:data) }
  let(:cooked_data) { create(:cooked_data) }

  context 'success' do
    before do
      flexmock(Weather::ElTiempo::ApiCall).
          should_receive(:run!).
          with(params).
          and_return(api_response).
          once

      flexmock(Weather::ElTiempo::ApiCallback).
          should_receive(:run!).
          with(api_response).
          and_return(body).
          once

      flexmock(Weather::ElTiempo::PrepareData).
          should_receive(:run!).
          with(body).
          and_return(data).
          once

      flexmock(Weather::ElTiempo::Summary).
          should_receive(:run!).
          with(data).
          and_return(cooked_data).
          once
    end

    it 'expected response' do
      expect(subject).to be_truthy
    end
  end
end
