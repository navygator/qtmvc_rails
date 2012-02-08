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
  end
end
