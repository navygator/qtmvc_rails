class RelationshipsController < ApplicationController

  add_breadcrumb 'Group list', :groups_path, :only => [:new]
  add_breadcrumb 'Add student', '', :only => [:new]

  def new
    @group = Group.find_by_id(params[:group_id])
    @relationship = @group.relationships.new
  end

  def create
    @group = Group.find(params[:relationship][:group_id])
    @relationship = @group.relationships.build(:employee_id => params[:relationship][:employee_id])
    if @relationship.save
      flash[:success] = "Successfully added to group"
      redirect_to edit_group_path(@group)
    else
      #TODO: Issue render /relationships URL
      render 'new'
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @employee = Employee.find(params[:id])
    @group.remove(@employee)
    redirect_to edit_group_path(@group)
  end

end
