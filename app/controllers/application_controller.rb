class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_initial_breadcrumbs

  private

  def set_initial_breadcrumbs
    add_breadcrumb "Home", :root_path
  end
end
