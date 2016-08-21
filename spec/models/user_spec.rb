require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it{is_expected.to have_many(:task_lists).dependent(:destroy)}
    it{is_expected.to have_many(:tasks)}
    it{is_expected.to have_and_belong_to_many(:favorites_task_lists)}
  end

  describe '#add_favorite!' do
    let!(:user) {create(:user)}
    let!(:task_list) {create(:task_list)}

    it do
      expect{ user.add_favorite!(task_list.id) }.to change(user.favorites_task_lists, :count).from(0).to(1)
    end

    it do
      user.add_favorite!(task_list.id)
      expect{ user.add_favorite!(task_list.id) }.not_to change(user.favorites_task_lists, :count)
    end
  end

  describe '#remove_favorite!' do
    let!(:task_list) {create(:task_list)}
    let!(:user) {create(:user, favorites_task_lists: [task_list])}

    it do
      expect{ user.remove_favorite!(task_list.id) }.to change(user.favorites_task_lists, :count).from(1).to(0)
    end
  end
end
