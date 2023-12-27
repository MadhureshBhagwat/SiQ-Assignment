# frozen_string_literal: true

# define ApplicationController class
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
end
