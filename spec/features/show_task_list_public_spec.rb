require "spec_helper"
require "rails_helper"

feature "show the public tasks lists" do
  before(:all) do
    create(:task_list, is_public: true, name: 'List 1')
    create(:task_list, is_public: true, name: 'List 2')
    create(:task_list, is_public: true, name: 'List 3')
  end

  scenario "show the lists publics", js: true do
    user = create(:user)
    login_as(user, scope: :user)
    visit(favorites_task_lists_path)
    TaskList.all.each do |task_list|
      expect(page).to have_content(task_list.name)
    end
  end
end
