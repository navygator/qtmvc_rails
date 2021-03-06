class Group < ActiveRecord::Base
  attr_accessible :name, :course_id, :instructor_id

  belongs_to :instructor
  belongs_to :course

  has_many :relationships,
           :dependent => :destroy
  has_many :students,
           :through => :relationships, :source => :employee

  validates :instructor_id, :presence => true
  validates :course_id, :presence => true
  validates :name, :presence => true

  def add(student)
    relationships.create!(:employee_id => student)
  end

  def remove(student)
    relationships.find_by_employee_id(student).destroy
  end
end
