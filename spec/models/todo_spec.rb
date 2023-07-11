require 'rails_helper'

RSpec.describe Todo, type: :model do
  it 'has a valid factory' do
    expect(create(:todo)).to be_valid
  end

  it { is_expected.to(validate_presence_of(:title)) }

  it 'calculates the total number of todos' do
    create_list(:todo, 3)
    expect(described_class.total_items).to eq 3
  end

  it 'counts the completed todo items' do
    create_list(:todo, 3)
    create_list(:todo, 2, completed: true)
    expect(described_class.completed_items).to eq 2
  end

  it 'calculates the completion percent' do
    create_list(:todo, 3)
    create_list(:todo, 2, completed: true)
    expect(described_class.percent_complete).to eq 40
  end

  describe '#self.status' do
    it 'calculates the not started status' do
      create_list(:todo, 3)
      expect(described_class.status).to eq 'Not Started'
    end

    it 'calculates the in progress status' do
      create_list(:todo, 3)
      create(:todo, completed: true)
      expect(described_class.status).to eq 'In Progress'
    end

    it 'calculates the completed status' do
      create_list(:todo, 3, completed: true)
      expect(described_class.status).to eq 'Completed'
    end
  end

  describe '#self.badge_color' do
    it 'calculates the not started status' do
      create_list(:todo, 3)
      expect(described_class.badge_color).to eq 'dark'
    end

    it 'calculates the in progress status' do
      create_list(:todo, 3)
      create(:todo, completed: true)
      expect(described_class.badge_color).to eq 'warning'
    end

    it 'calculates the completed status' do
      create_list(:todo, 3, completed: true)
      expect(described_class.badge_color).to eq 'success'
    end
  end
end
