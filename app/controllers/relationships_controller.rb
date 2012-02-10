class RelationshipsController < ApplicationController

  add_breadcrumb 'Group list', :groups_path, :only => [:new]
  add_breadcrumb 'Add student', '', :only => [:new]

  def new
    @group = Group.find_by_id(params[:group_id])
    @relationship = @group.relationships.new
    @organizations = Organization.all
    @employees = []
  end

  def create
  end

  def destroy
  end

end
