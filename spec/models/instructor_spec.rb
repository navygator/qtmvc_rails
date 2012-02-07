require 'spec_helper'

describe Instructor do
  let(:valid_attr) { { :fio => 'Example User', :email => 'user@example.org'} }

  it "should create instance given valid attributes" do
    Instructor.create!(valid_attr)
  end

  describe "organizations relations" do
    before(:each) do
      @instructor = Instructor.create(valid_attr)
    end

    it "should have organizations" do
      @instructor.should respond_to(:organizations)
    end
  end

  describe "groups relations" do
    before(:each) do
      @instructor = Instructor.create(valid_attr)
    end

    it "should have groups" do
      @instructor.should respond_to(:groups)
    end
  end
end
