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
    let!(:task_list_open) {create :task_list, done: false}
    let!(:task_list_close) {create :task_list, done: true}
    it { expect{ task_list_open.close! }.to change(task_list_open, :done).from(false).to(true) }
    it { expect{ task_list_close.close! }.to_not change(task_list_close, :done) }
  end

  describe '#open' do
    let!(:task_list_open) {create :task_list, done: false}
    let!(:task_list_close) {create :task_list, done: true}
    it { expect(task_list_open.open?).to be_truthy }
    it { expect(task_list_close.open?).to be_falsey }
  end

  describe '#check_and_close_tasks!' do
    let!(:task_list) {create :task_list, done: false}
    let!(:task) {create :task, task_list_id: task_list.id, done: false}

    it {expect{task_list.check_and_close_tasks!}.to change(task_list, :done).from(false).to(true) }
    it {expect{task.check_and_close_tasks!}.to change(task, :done).from(false).to(true) }
  end
end
