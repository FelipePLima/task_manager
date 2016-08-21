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
    it{is_expected.to have_and_belong_to_many(:favorites_users)}
  end

  describe 'multiples tasks' do
    it { is_expected.to accept_nested_attributes_for(:tasks) }
  end

  describe 'public_lists' do
    let!(:list_public)  {create :task_list, is_public: true}
    let!(:list_private) {create :task_list, is_public: false}
    it{expect(TaskList.public_lists).to include(list_public)}
    it{expect(TaskList.public_lists).not_to include(list_private)}
  end

  describe '#close!' do
    let!(:task_list) {create :task_list, done: false}
    it{expect(task_list.close!).to be_truthy}
  end
end
