# encoding: UTF-8
require 'rails_helper'

RSpec.describe TaskListsHelper, type: :helper do
  describe "finish_task_list_link" do
    context "when tasklist is open" do
      let!(:task_list) {create :task_list, done: false}
      xit "should return link" do
        expect(finish_task_list_link(task_list)).to eq("<a rel=\"nofollow\" data-method=\"put\" href=\"/task_lists/#{task_list.id}/close\">Fechar</a>"
)
      end
    end
    context "when tasklist is close" do
      let!(:task_list) {create :task_list, done: true}
      it "should no return link" do
        expect(finish_task_list_link(task_list)).to be_blank
      end
    end
  end

  describe "finish_task_link" do
    context "when task is open" do
      let!(:task) {create :task, done: false}
      xit "should return link" do
        expect(finish_task_link(task)).to eq("<a rel=\"nofollow\" data-method=\"put\" href=\"/tasks/#{task.id}/close\">Fechar</a>"
)
      end
    end
    context "when task is close" do
      let!(:task) {create :task, done: true}
      it "should no return link" do
        expect(finish_task_link(task)).to be_blank
      end
    end
  end
end
