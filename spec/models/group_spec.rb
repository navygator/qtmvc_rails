require 'spec_helper'

describe Group do
  let(:valid_attr) { { :name => "Sample Group", :instructor_id => 1, :course_id => 1 } }

  it "should create the new instance given valid attributes" do
    Group.create!(valid_attr)
  end

  it "should require instructor_id" do
    @group = Group.create(valid_attr.merge(:instructor_id => nil))
    @group.should_not be_valid
  end

  it "should require course_id" do
    @group = Group.create(valid_attr.merge(:course_id => nil))
    @group.should_not be_valid
  end

  describe "relationships" do
    before(:each) do
      @group = Group.create(valid_attr)
    end

    it "should have students" do
      @group.should respond_to(:students)
    end

    it "should have relationships" do
      @group.should respond_to(:relationships)
    end
    it "should have instructor method" do
      @group.should respond_to(:instructor)
    end

    it "should have course method" do
      @group.should respond_to(:course)
    end
  end
end
