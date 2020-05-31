# frozen_string_literal: true

class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @dashboards = current_user.dashboards
  end

  def new; end

  def create
    
  end
end
