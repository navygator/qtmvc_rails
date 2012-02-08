class Instructor < ActiveRecord::Base
  has_many :organizations
  has_many :groups
end
