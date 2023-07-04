require 'rails_helper'

RSpec.describe Todo, type: :model do
  it 'has a valid factory' do
    expect(create(:todo)).to be_valid
  end

  it { is_expected.to(validate_presence_of(:title)) }
end
