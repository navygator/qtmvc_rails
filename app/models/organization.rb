class Organization < ActiveRecord::Base
  attr_accessible :name, :inn

  belongs_to :instructor
  has_many :employees

  inn_regex = /\d[10]/
  validates :name, :presence => true
  validates :inn, :presence => true, :length => { :is => 10 }, :format => { :with => inn_regex }

  #TODO: Select employees that not in current group
  def employees_select_by(group)
    employees
  end
end
