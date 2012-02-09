class Instructor < ActiveRecord::Base
  attr_accessible :fio, :email

  has_many :organizations
  has_many :groups
end
