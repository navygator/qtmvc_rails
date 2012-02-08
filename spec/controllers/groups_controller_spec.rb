require 'spec_helper'

describe GroupsController do
  render_views

  describe "GET 'index'" do
    before(:each) do
      @group = Factory(:group)
    end

    it "returns http success" do
      get :index
      response.should be_success
    end

    it "should contains group name" do
      get :index
      response.should have_selector("td", :content => @group.name)
    end

    it "should contains instructor fio" do
      get :index
      response.should have_selector("td", :content => @group.instructor.fio)
    end

    it "should contains student count" do
      get :index
      response.should have_selector("td", :content => @group.students.length.to_s)
    end

    it "should have link to edit group" do
      get :index
      response.should have_selector("a", :href=> group_path(@group), :content => 'edit')
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      response.should be_success
    end

    it "should have instructor selector" do
      get :new
      response.should have_selector("select[name='group[instructor_id]']")
    end

    it "should have name field" do
      get :new
      response.should have_selector("input[name='group[name]'][type='text']")
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      @group = Factory(:group)
    end
    it "returns http success" do
      get :edit, :id => @group
      response.should be_success
    end
  end

end
