require 'spec_helper'

describe Group do
  let(:valid_attr) { { :name => "Sample Group" } }

  it "should create the new instance given valid attributes" do
    Group.create!(valid_attr)
  end

  describe "employee relationships" do
    before(:each) do
      @group = Group.create(valid_attr)
    end

    it "should have students" do
      @group.should respond_to(:students)
    end

    it "should have relationships" do
      @group.should respond_to(:relationships)
    end
  end
end
