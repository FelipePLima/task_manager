require "spec_helper"
require "rails_helper"

feature "create task list" do
  scenario "simple task list", js: true do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)

    visit(new_task_list_path)
    fill_in "Nome", with: "Tarefas de segunda"
    click_button("Salvar")

    expect(page).to have_content 'Lista de Tarefas criado com sucesso!'
  end

  scenario "complex task list", js: true do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)

    visit(new_task_list_path)
    fill_in "Nome", with: "Tarefas de terça"
    click_link("Adicionar Tarefa")
    within(".nested-fields") do
      fill_in "Nome", with: "Tomar café"
    end
    click_link("Adicionar Tarefa")
    within(all(".nested-fields")[1]) do
      fill_in "Nome", with: "Trabalhar"
    end
    click_button("Salvar")
    expect(page).to have_content 'Lista de Tarefas criado com sucesso!'
  end
end
