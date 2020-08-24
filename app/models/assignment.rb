class Assignment < ApplicationRecord
  belongs_to :course
  belongs_to :user

   #works!
  scope :due_date, -> { where.not(due: nil)}
  scope :incomplete, -> { where(completed: 'no') }
  scope :sorted_incomplete, -> { self.incomplete.order(due_date: :desc)}
  scope :search, -> (term) { self.due_date.where("title LIKE ?", "%#{term}%") } #this does not work #
  # def self.completed
  #   where.not(completed: false)
  # end
  validates_presence_of :name, :due
end 
  