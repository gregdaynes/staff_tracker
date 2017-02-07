class StaffMembersController < ApplicationController
  def index
    @staff_members = StaffMember.all

    render json: @staff_members
  end

  def show
    @staff_member = StaffMember.find(params[:id])

    render json: @staff_member
  end

  def new
    @staff_member = StaffMember.new
  end

  def edit
    @staff_member = StaffMember.find(params[:id])
  end

  def create
    @staff_member = StaffMember.new(staff_member_params)

    if @staff_member.save
      redirect_to @staff_member
    else
      render 'new'
    end
  end

  def update
    @staff_member = StaffMember.find(params[:id])

    if @staff_member.update(staff_member_params)
      redirect_to @staff_member
    else
      render 'edit'
    end
  end

  def destroy
    @staff_member = StaffMember.find(params[:id])
    @staff_member.destroy

    redirect_to staff_members_path
  end

  private
    def staff_member_params
      params.require(:staff_member).permit(:first_name)
    end
end
