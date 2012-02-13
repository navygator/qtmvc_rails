require 'spec_helper'

describe RelationshipsController do
  describe "GET 'new'" do
    before(:each) do
      @group = Factory(:group)
      @employee = Factory(:employee)
    end

    it "returns http success" do
      get :new, :group_id => @group
      response.should be_success
    end

    it "should assign group variable" do
      get :new, :group_id => @group
      assigns(:group).should eq @group
    end
  end

  describe "POST 'create'" do
    before(:each) do
      @group = Factory(:group)
    end

    describe "failure" do
      let(:invalid) { { :group_id => @group.id } }

      it "should not create new relationship" do
        expect { post :create, :relationship => invalid }.to_not change(Relationship, :count)
      end

      it "should render new page" do
        post :create, :relationship => invalid
        response.should render_template('new')
      end
    end

    describe "success" do
      before(:each) do
        @employee = Factory(:employee)
        @relationship =  { :group_id => @group,  :employee_id => @employee }
      end

      it "should create new relationship" do
        expect { post :create, :relationship => @relationship }.to change(Relationship, :count).by(1)
      end

      it "should redirect to edit group page" do
        post :create, :relationship => @relationship
        response.should redirect_to(edit_group_path(@group))
      end
    end
  end

  describe "DELETE 'destroy'" do
    #TODO: Some tests here
  end
end
