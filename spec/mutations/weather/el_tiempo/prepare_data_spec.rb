require 'rails_helper'

RSpec.describe Weather::ElTiempo::PrepareData do
  subject { described_class.run!(params) }

  let(:params) { create(:body_json) }

  it '' do
    subject
  end


end
