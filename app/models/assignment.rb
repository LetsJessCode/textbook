class Assignment < ApplicationRecord
  belongs_to :course
  belongs_to :user

  
  scope :completed, -> { where.not(completed: :false)} #works!
  scope :incomplete, -> { where(completed: false) } # works!
  # scope :search, -> (term) { self.all.where("name LIKE ?", "%#{term}#%") } #this does not work #
  # def self.completed
  #   where.not(completed: false)
  # end
end 
  