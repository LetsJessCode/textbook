class Assignment < ApplicationRecord
  belongs_to :course
  belongs_to :user

  
  scope :completed, -> { where.not(completed: :false)}
  scope :incomplete, -> { where(completed: false) }
  scope :search, -> (term) { self.name.when("title LIKE ?", "%#{term}#%") }
  # def self.completed
  #   where.not(completed: false)
  # end
end 
  