require 'spec_helper'

describe "Groups" do
  describe "Create new group" do
    before(:each) do
      @first_instructor = Factory(:instructor)
      @second_instructor = Factory(:instructor, :fio => "Billy Second")
    end

    it "should have create new group page" do
      visit root_path
      click_button
      response.should render_template('groups/new')
    end

    it "should create new group" do
      lambda do
        visit new_group_path
        fill_in :name, :with => "Sample Group 1"
        select "Billy Second", :from => "Instructor"
        click_button
        response.should render_template('groups/edit')
      end.should change(Group, :count).by(1)
    end
  end

  describe "Edit group" do
    before(:each) do
      @group = Factory(:group)
      @student = Factory(:employee)
      @group.add(@student)
    end

    it "should rename group" do
      visit edit_group_path(@group)
      fill_in "group[name]", :with => "New Group Name"
      click_button
      response.should have_selector("td", :content => "New Group Name")
    end

    it "should have add student feature" do
      visit edit_group_path(@group)
      click_button "Add to group"
      response.should render_template('relationships/new')
    end
  end
end
