require 'rails_helper'

RSpec.describe Weather::ElTiempo::ApiCall do
  subject { described_class.run!(params) }

  let(:params) do
    {
        localidad: localidad
    }
  end
  # Gavà
  let(:localidad) { 1381 }

  context 'success' do
    it 'expected results' do
      expect(subject.code).to  eq('200')
    end
  end
end
