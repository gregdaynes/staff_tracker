# app/controllers/staff_controller.rb
class StaffController < ApplicationController
  def index
    @staff = Staff.all
  end

  def show
    @staff = Staff.find(params[:id])
    @person = Person.find(@staff.person)
  end

  def new
    @staff = Staff.new
    @person = Person.all
  end

  def edit
    @staff = Staff.find(params[:id])
  end

  def create
    @staff = Staff.new(staff_params)

    if @staff.save!
      flash[:notice] = 'Staff member was successfully created.'
      redirect_to @staff
    else
      render 'new'
    end
  end

  def update
    @staff = Staff.find(params[:id])

    if @staff.update!(staff_params)
      flash[:notice] = 'Staff member was successfully updated.'
      redirect_to @staff
    else
      render 'edit'
    end
  end

  def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy

    redirect_to staff_index_path
  end

  private

  def staff_params
    params.require(:staff).permit(:pod, :started_at_company, :person_id)
  end
end
