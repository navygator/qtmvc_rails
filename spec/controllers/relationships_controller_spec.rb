require 'spec_helper'

describe RelationshipsController do

  describe "GET 'new'" do
    before(:each) do
      @employee = Factory(:employee)
    end

    it "returns http success" do
      get :new, :group_id => 1
      response.should be_success
    end

    it "should assign organization collection" do
      get :new, :group_id => 1
      assigns(:organizations).should eq [@employee.organization]
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "DELETE 'destroy'" do
    #TODO: Some tests here
  end
end
