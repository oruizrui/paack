require 'rails_helper'

RSpec.describe Weather::ElTiempo::ApiCallback do
  subject { described_class.run!(params) }

  let(:params) do
    {
        code: code,
        body: body
    }
  end

  context 'success' do
    context '100' do
      let(:code) { 100 }
      let(:body) {  }

      it 'test' do
        debugger
      end
    end
  end
end
