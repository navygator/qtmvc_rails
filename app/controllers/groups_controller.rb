class GroupsController < ApplicationController

  add_breadcrumb 'Groups', :groups_path
  add_breadcrumb 'Create a new group', '', :only => [:new, :create]
  add_breadcrumb 'Edit a group', '', :only => [:edit, :update]

  def index
    @title = "Groups"
    @groups = Group.all
  end

  def new
    @title = "New"
    @group = Group.new
    @instructors = Instructor.all
  end

  def edit
  end

  def update

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
