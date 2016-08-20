require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it{is_expected.to have_many(:task_lists).dependent(:destroy)}
  end
end
