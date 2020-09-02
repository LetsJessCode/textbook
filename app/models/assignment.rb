class Assignment < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates_presence_of :name, :due
  
  #works!
  # scope :due_date, -> { where.not(due: nil)}
  scope :incomplete, -> { where(completed: "no") }
  scope :sorted_incomplete, -> { self.incomplete.order(due: :asc)}
  # scope :search, -> (term) { self.due_date.where("title LIKE ?", "%#{term}%") } #this does not work #
  def order_by_date

  end
end 
  