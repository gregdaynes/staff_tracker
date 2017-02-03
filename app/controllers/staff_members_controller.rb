class StaffMembersController < ApplicationController
  def index
    @staff_members = StaffMember.all
  end

  def show
    @staff_member = StaffMember.find(params[:id])
  end

  def new
    @staff_member = StaffMember.new
  end

  def create
    @staff_member = StaffMember.new(staff_member_params)

    if @staff_member.save
      redirect_to @staff_member
    else
      render 'new'
    end
  end

  private

  def staff_member_params
    params.require(:staff_member).permit(:first_name)
  end
end
