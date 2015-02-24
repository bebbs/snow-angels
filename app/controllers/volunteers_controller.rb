class VolunteersController < ApplicationController
  def index

  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      redirect_to volunteers_path
      flash[:notice] = "Thank you for your registration"
    else
      render 'new'
    end
  end

  def show
  end

  def volunteer_params
    params.require(:volunteer).permit(:name)
  end

end
