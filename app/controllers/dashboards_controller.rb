# frozen_string_literal: true

class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @dashboards = current_user.dashboards
  end

  def new
    @dashboard = current_user.dashboards.build
  end

  def create
    current_user.dashboards.create(dashboard_params)
    redirect_to root_path
  end

  private

  def dashboard_params
    params.require(:dashboard).permit(:headline, :content)
  end
end
