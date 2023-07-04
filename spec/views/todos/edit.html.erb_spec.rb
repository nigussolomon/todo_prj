require 'rails_helper'

RSpec.describe 'todos/edit', type: :view do
  let(:todo) do
    Todo.create!(
      title: 'MyString',
      completed: false
    )
  end

  before do
    assign(:todo, todo)
  end

  it 'renders the edit todo form' do
    render

    assert_select 'form[action=?][method=?]', todo_path(todo), 'post' do
      assert_select 'input[name=?]', 'todo[title]'

      assert_select 'input[name=?]', 'todo[completed]'
    end
  end
end
