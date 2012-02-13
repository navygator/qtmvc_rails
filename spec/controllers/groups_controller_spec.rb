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
      response.should have_selector("a", :href=> edit_group_path(@group), :content => 'edit')
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
    describe "failure" do
      let(:invalid) { { :instructor_id => nil, :course_id => nil, :name => "" } }

      it "should not create group" do
        expect { post :create, :group => invalid }.to_not change(Group, :count)
      end

      it "should render 'new' page" do
        post :create, :group => invalid
        response.should render_template('new')
      end
    end

    describe "success" do
      let(:valid) { { :instructor_id => 1, :course_id => 1, :name => "Sample group" } }

      it "should create group" do
        expect { post :create, :group => valid }.to change(Group, :count)
      end

      it "should redirect to group edit page" do
        post :create, :group => valid
        response.should redirect_to edit_group_path(assigns(:group))
      end
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      @group = Factory(:group)
      @student = Factory(:employee)
      @group.add(@student)
    end
    it "returns http success" do
      get :edit, :id => @group
      response.should be_success
    end

    it "should have instructor fio" do
      get :edit, :id => @group
      response.should have_selector("label", :for => "group_instructor_id",
                                    :content => @group.instructor.fio )
    end

    it "should have name field" do
      get :edit, :id => @group
      response.should have_selector("input[name='group[name]'][type='text']")
    end

    it "should have student fio" do
      get :edit, :id => @group
      response.should have_selector("td", :content => @student.fio)
    end

    it "should have organization name" do
      get :edit, :id => @group
      response.should have_selector("td", :content => @student.organization.name)
    end

    it "should have link to delete user from group" do
      get :edit, :id => @group
      response.should have_selector("td", :content => "delete")
    end

    it "should have button to add student to group" do
      get :edit, :id => @group
      response.should have_selector("form.button_to", :action => new_group_student_path(@group.id))
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      @group = Factory(:group)
    end

    describe "failure" do
      it "should render edit page" do
        put :update, :id => @group, :group => { :name => "" }
        response.should render_template("edit")
      end
    end

    describe "success" do
      it "should change name" do
        put :update, :id => @group, :group => { :name => "New name" }
        assigns(:group).name.should eq "New name"
      end

      it "should have flash message" do
        put :update, :id => @group, :group => { :name => "New name" }
        flash[:success].should =~ /group updated/i
      end
    end
  end
end
