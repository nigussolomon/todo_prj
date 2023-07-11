require 'rails_helper'

RSpec.describe 'Todos', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'loads home page with root url' do
    visit todos_path
    expect(page).to have_content('Todo List')
  end

  it 'loads todo list in homepage' do
    todo1 = create(:todo)
    todo2 = create(:todo)
    visit todos_path
    expect(page).to have_content(todo1.title)
    expect(page).to have_content(todo2.title)
  end

  it 'adds new todo to the todo list' do
    visit todos_path
    fill_in 'todo[title]', with: 'Sample todo'
    click_button 'Add'
    expect(page).to have_content('Sample todo')
  end

  it 'shows the correct % of completed todos' do
    create(:todo, completed: true)
    create_list(:todo, 3)
    visit todos_path
    expect(page).to have_content('25% complete (1/4 Todo Items completed)')
  end

  it 'shows the correct progress in progress bar' do
    create(:todo, completed: true)
    create_list(:todo, 3)
    visit todos_path
    expect(find('div.progress-bar.bg-info')['style']).to have_content('width: 25%')
  end
end
