class Todo < ApplicationRecord
  validates :title, presence: true

  def self.total_items
    Todo.count
  end

  def self.completed_items
    Todo.where(completed: true).count
  end

  def self.percent_complete
    return 0 if total_items.zero?

    ((completed_items.to_f / total_items) * 100).round(0)
  end

  def self.status
    case percent_complete
    when 0
      'Not Started'
    when 100
      'Completed'
    else
      'In Progress'
    end
  end

  def self.badge_color
    case percent_complete
    when 0
      'dark'
    when 100
      'success'
    else
      'warning'
    end
  end
end
