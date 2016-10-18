class InviteesController < ApplicationController
  before_action :authenticate_user!

  def index
    @invitees = current_user.invitees.order(:name)
  end

  def new
    @invitee = current_user.invitees.build
    render layout: false
  end

  def create
    @invitee = current_user.invitees.build(permitted_params)
    if @invitee.save
      flash[:success] = "You have added your invitee successfully."
      redirect_to invitees_path
    else
      flash[:error] = error_messages(@invitee)
    end
  end

  def edit
    @invitee = current_user.invitees.find(params[:id])
    render layout: false
  end

  def update
    @invitee = current_user.invitees.find(params[:id])
    if @invitee.update(permitted_params)
      flash[:success] = "You have updated your invitee successfully."
      redirect_to invitees_path
    else
      flash[:error] = error_messages(@invitee)
    end
  end

  def destroy
    @invitee = current_user.invitees.find(params[:id])
    if @invitee.destroy
      flash[:success] = "You have deleted your invitee successfully."
    else
      flash[:error] = error_messages(@invitee)
    end
    redirect_to invitees_path
  end

  private
  def permitted_params
    params.require(:invitee).permit(:name, :street, :city, :state, :mobile, :is_invited, :call_count)
  end
end
