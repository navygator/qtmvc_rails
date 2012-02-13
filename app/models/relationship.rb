class Relationship < ActiveRecord::Base
  attr_accessible :employee_id

  belongs_to :employee
  belongs_to :group

  validates :group_id, :presence => true
  validates :employee_id, :presence => true
end
