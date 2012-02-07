require 'spec_helper'

describe Employee do
  let(:valid_attr) { { :name => "Example Employee" } }

  it "should create the new instance give valid attributes" do
    Employee.create!(valid_attr)
  end

  describe "groups relation" do
    before(:each) do
      @employee = Employee.creat(valid_attr)
    end

    it "should have groups attribute" do
      @employee.should respond_to(:groups)
    end
  end
end
