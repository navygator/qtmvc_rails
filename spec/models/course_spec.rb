require 'spec_helper'

describe Course do
  let(:valid_attr) { { :name => "Test course" } }

  it "should create the new instance given valid attributes" do
    Course.create!(valid_attr)
  end
end
