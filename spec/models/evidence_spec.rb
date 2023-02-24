require 'rails_helper'

RSpec.describe Evidence, type: :model do
  describe 'validations' do
    it { should have_many(:users) }
    it { should have_many(:questions) }
  end
end
