require 'spec_helper'

describe Employee do
  let(:valid_attr) { { :fio => "Example Employee" } }

  it "should create the new instance give valid attributes" do
    Employee.create!(valid_attr)
  end

  it "should require fio" do
    @employee = Employee.new(valid_attr.merge(:fio => ""))
    @employee.should_not be_valid
  end

  it "should reject to short names" do
    @employee = Employee.new(valid_attr.merge(:fio => 'a' * 9))
    @employee.should_not be_valid
  end

  describe "groups relationships" do
    before(:each) do
      @employee = Employee.create!(valid_attr)
      @group = Factory(:group)
    end

    it "should have groups method" do
      @employee.should respond_to(:groups)
    end

    it "should have relationships method" do
      @employee.should respond_to(:relationships)
    end
  end
end