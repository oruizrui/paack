require 'rails_helper'

RSpec.describe Weather::ElTiempo::ApiCall do
  subject { described_class.run!(params) }

  let(:params) do
    {
        localidad: localidad
    }
  end
  let(:request_params) do
    {
        affiliate_id: affiliate_id,
        localidad: localidad,
        api_lang: 'es',
        v: '3.0'
    }
  end

  let(:localidad) { 1234 }
  let(:uri) { Weather::ElTiempo::ApiCall::BASE_URI }
  let(:affiliate_id) { Weather::ElTiempo::ApiCall::AFFILIATE_ID }

  context 'success' do
    it 'expected results' do
      flexmock(Paack::Request).
          should_receive(:request).
          with(
              base_uri: uri,
              params: request_params
          ).
          once

      subject
    end
  end
end
