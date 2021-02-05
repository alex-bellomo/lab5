class Chore < ApplicationRecord
    has_many :tasks
    belongs_to :child
    belongs_to :task
end
