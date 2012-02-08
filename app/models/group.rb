class Group < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :course

  has_many :relationships,
           :dependent => :destroy
  has_many :students,
           :through => :relationships, :source => :employee

  validates :instructor_id, :presence => true
  validates :course_id, :presence => true
  validates :name, :presence => true
end
