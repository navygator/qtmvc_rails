require 'spec_helper'

describe "relationships/new.html.erb" do
  before(:each) do
    @organization = Factory(:organization)
    @group = Factory(:group)
    assign(:group, @group)
    assign(:relationship, @group.relationships.new)
  end

  it "should render group name" do
    render
    rendered.should have_selector("label", :content => @group.name)
  end

  it "should render instructor fio" do
    render
    rendered.should have_selector("label", :content => @group.instructor.fio)
  end

  it "should render organization select" do
    render
    rendered.should have_selector("select#organization_id")
  end

  it "should render employee select" do
    render
    rendered.should have_selector("select#relationship_employee_id")
  end
end
