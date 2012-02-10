class GroupsController < ApplicationController

  add_breadcrumb 'Create a new group', '', :only => [:new, :create]
  add_breadcrumb 'Edit a group', '', :only => [:edit, :update]

  def index
    @title = "Group list"
    @groups = Group.all
  end

  def new
    @title = "New group"
    @group = Group.new
    @instructors = Instructor.all
  end

  def edit
    @title = "Edit group"
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      flash[:success] = "Group updated"
      redirect_to groups_path
    else
      @title = "Edit group"
      render 'edit'
    end
  end

  def create
    @group = Group.new(params[:group].merge(:course_id => 1))
    if @group.save
      flash[:success] = 'Group created'
      redirect_to edit_group_path @group
    else
      @title = "New"
      @instructors = Instructor.all
      render 'new'
    end
  end
end
