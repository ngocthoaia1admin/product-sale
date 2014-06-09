class Anonymous::BaseAnonymousController < ApplicationController
  layout "anonymous/application.html.erb"
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
end