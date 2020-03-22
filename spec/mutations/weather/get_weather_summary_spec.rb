require 'rails_helper'

RSpec.describe Weather::GetWeatherSummary do
  subject { described_class.run!(params) }

  let(:params) { {city_id: localidad, provider: 'el-tiempo'} }
  let(:localidad) { 1234 }
  let(:cooked_data) { create(:cooked_data) }

  context 'success' do
    before do
      flexmock(Weather::ElTiempo::GetSummary).
          should_receive(:run!).
          with({localidad: localidad}).
          and_return(cooked_data).
          once
    end

    it 'expected result' do
      expect(subject).to be_truthy
    end
  end

end
