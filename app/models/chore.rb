class Chore < ApplicationRecord
    has_many :tasks
    belongs_to :child
    belongs_to :task

    validates_date :due_on

    scope :alphabetical, -> { order(:name) }
    scope :by_task, -> { joins(:task).order("tasks.name") }
    scope :done, -> { where(completed:true) }
    scope :pending, -> { where(completed:false) }
    scope :chronological, -> { order("due_on", "completed")}
    scope :upcoming, -> { where("due_on >= ?", Date.current) }
    scope :past, -> { where("due_on < ?", Date.current) }

    def status
        if (completed)
            return "Completed"
        end
        return "Pending"
    end
end
