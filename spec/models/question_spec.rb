require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'validations' do
    it { should have_many(:evidences) }
  end
end
