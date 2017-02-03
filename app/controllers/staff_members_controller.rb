class StaffMembersController < ApplicationController
  def new
  end

  def create
    render plain: params[:staff_member].inspect
  end
end
