require 'rails_helper'

RSpec.describe Weather::ElTiempo::PrepareData do
  subject { described_class.run!(params) }

  let(:params) { create(:body) }

  it '' do
    subject
  end


end
