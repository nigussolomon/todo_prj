require 'rails_helper'

RSpec.describe 'todos/index', type: :view do
  before do
    assign(:todos, [
             Todo.create!(
               title: 'Title',
               completed: false
             ),
             Todo.create!(
               title: 'Title',
               completed: false
             )
           ])
  end

  it 'renders a list of todos' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
