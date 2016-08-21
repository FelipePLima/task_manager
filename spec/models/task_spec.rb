require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "validations" do
    it{is_expected.to validate_presence_of(:description)}
  end

  describe "associations" do
    it{is_expected.to belong_to(:task_list)}
  end

  describe "#close!" do
    let!(:task) {create :task, done: false}
    it{expect(task.close!).to be_truthy}
  end
end
