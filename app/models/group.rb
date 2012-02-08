class Group < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :course

  has_many :relationships,
           :dependent => :destroy
  has_many :students,
           :through => :relationships, :source => :employee
  #has_many :employees, :through => :relationships
end
