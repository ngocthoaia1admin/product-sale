class Admin::BaseAdminController < ApplicationController
  layout "admin/application.html.erb"
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_admin!
  protect_from_forgery with: :exception
end