require 'rails_helper'

RSpec.describe Weather::ElTiempo::Summary do
  subject { described_class.run!(params) }

  let(:params) { create(:data) }
  let(:expected_data) {create(:cooked_data)}

  it 'expected response' do
    expect(subject).to be_truthy
    expect(subject).to match(expected_data)
  end
end
