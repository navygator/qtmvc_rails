require 'spec_helper'

describe Relationship do
  it "should require student id" do
    @relationship = Relationship.new(:employee_id => 1)
    @relationship.should_not be_valid
  end

  it "should require group id" do
    @relationship = Relationship.new(:group_id => 1)
    @relationship.should_not be_valid
  end
end
