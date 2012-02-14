require 'spec_helper'

describe "ManageStudents" do
  before(:each) do
    @group = Factory(:group)
    @student = Factory(:employee)
  end

  describe "Add to group" do
    describe "success" do
      it "should add student to group" do
        visit edit_group_path(@group)
        click_button "Add to group"
        select @student.fio, :from => "relationship[employee_id]"
        click_button
        response.should render_template("groups/edit")
        response.should have_selector("td", :content => @student.fio)
      end
    end

    describe "failure" do
      it "should have error info" do
        visit edit_group_path(@group)
        click_button "Add to group"
        click_button
        response.should render_template("relationships/new")
        response.should have_selector("div#error_explanation")
      end
    end
  end

  it "should delete student from group" do
    @group.add(@student)
    visit edit_group_path(@group)
    click_link "delete"
    response.should render_template('groups/edit')
    response.should_not have_selector("td", :content => @student.fio)
  end
end
