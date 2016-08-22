# encoding: UTF-8
require 'rails_helper'

RSpec.describe TaskListsHelper, type: :helper do
  describe "finish_task_list_link" do
    let!(:current_user) { create :user }

    context "when tasklist is open" do
      context "when user isn't the task_list owner" do
        let!(:task_list) {create :task_list, done: false}
        it "should return link" do
          expect(finish_task_list_link(task_list)).to be_blank
        end
      end
      context "when user is the task_list owner" do
        let!(:task_list) {create :task_list, done: false, user: current_user}
        it "should be blank" do
          expect(finish_task_list_link(task_list)).to eq("<a class=\"red\" rel=\"nofollow\" data-method=\"put\" href=\"/task_lists/2/close\"><i class=\"fa fa-times\"></i></a>"
  )
        end
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
    let!(:current_user) { create :user }

    context "when task is open" do
      context 'when user isnt the task owner' do
        let!(:task) {create :task, done: false}
        it "should return link" do
          expect(finish_task_link(task)).to be_blank
        end
      end
      context "when user is the task owner" do
        let!(:task_list) {create :task_list, done: false, user: current_user}
        let!(:task) {create :task, done: false, task_list: task_list}
        it "should be blank" do
          expect(finish_task_link(task)).to eq("<a class=\"red\" rel=\"nofollow\" data-method=\"put\" href=\"/tasks/2/close\"><i class=\"fa fa-times\"></i></a>"
  )
        end
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
