require 'rails_helper'

RSpec.describe 'todos/index', type: :view do
  before do
    assign(:todos, [
             Todo.create!(
               title: 'Title I',
               completed: false
             ),
             Todo.create!(
               title: 'Title II',
               completed: false
             )
           ])
  end

  it 'renders a list of todos' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'ul>li>div>span' : 'tr>td'
    # assert_select cell_selector, text: Regexp.new('Title I'.to_s), count: 2
    # assert_select cell_selector, text: Regexp.new('Title II'.to_s), count: 1
    # assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
