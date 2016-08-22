require "spec_helper"
require "rails_helper"

feature "show the public tasks lists" do
  before(:all) do
    user1 = FactoryGirl.create(:user)
    @task_lists = []
    3.times{ @task_lists << FactoryGirl.create(:task_list, is_public: true, user_id: user1.id) }
  end
  scenario "show the lists publics", js: true do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit(favorites_task_lists_path)
    @task_lists.each do |task_list|
      expect(page).to have_content(task_list.name)
    end
  end
end
