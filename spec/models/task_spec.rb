require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "validations" do
    it{is_expected.to validate_presence_of(:description)}
  end

  describe "associations" do
    it{is_expected.to belong_to(:task_list)}
    it{is_expected.to belong_to(:task_parent)}
    it{is_expected.to have_many(:task_children).dependent(:destroy)}
  end

  describe 'multiples task_children' do
    it { is_expected.to accept_nested_attributes_for(:task_children) }
  end

  describe "#close!" do
    let!(:task_open) {create :task, done: false}
    let!(:task_close) {create :task, done: true}
    it{ expect{ task_open.close! }.to change(task_open, :done).from(false).to(true) }
    it{ expect{ task_close.close! }.to_not change(task_open, :done) }
  end

  describe '#owner' do
    let!(:user) {create :user}
    let!(:task_list) {create :task_list, user: user}
    let!(:task) {create :task, task_list: task_list}

    it { expect(task.owner).to eq user }
  end

  describe '#open?' do
    let!(:task) {create :task, done: false}

    it{expect(task.open?).to eq(true)}
    it{expect(task.open?).not_to eq(false)}
  end

end
