class Assignment < ApplicationRecord
  belongs_to :course
  belongs_to :user

  scope :completed, -> { where.not(completed: nil) } #works!
  scope :sorted_completed, -> { self.completed.order(completed: :desc)}
  scope :incomplete, -> { where(completed: nil) } # works!
  # scope :search, -> (term) { self.all.where("name LIKE ?", "%#{term}#%") } #this does not work #
  # def self.completed
  #   where.not(completed: false)
  # end
  validates_presence_of :name, :due
end 
  