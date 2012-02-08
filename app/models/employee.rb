class Employee < ActiveRecord::Base
  attr_accessible :fio

  belongs_to :organization
  has_many :relationships,
           :dependent => :destroy
  has_many :groups, :through => :relationships

  validates :fio, :presence => true, :length => { :minimum => 10 }

  def enter!(group)
    relationships.create!(:group_id => group.id)
  end

  def leave!(group)
    relationships.find_by_group_id(group.id).destroy
  end

  def in_group?(group)
    relationships.find_by_group_id(group.id)
  end
end
