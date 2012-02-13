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
      render 'new'
    end
  end

  def destroy
  end

end
