# encoding: UTF-8
require 'rails_helper'

RSpec.describe TaskList, type: :model do
  describe "validations" do
    it{is_expected.to validate_presence_of(:name)}
    it{is_expected.to validate_presence_of(:user)}
  end

  describe "associations" do
    it{is_expected.to belong_to(:user)}
    it{is_expected.to have_many(:tasks).dependent(:destroy)}
  end
end
