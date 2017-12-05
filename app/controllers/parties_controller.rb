class PartiesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_party, only: [:edit, :update, :show, :destroy]

  def index
    page = params[:page].present? ? params[:page] : 1
    @parties = current_user.parties.paginate(page: page, per_page: 30)
  end

  def new
    @party = current_user.parties.build
  end

  def create
    @party = current_user.parties.build(permitted_params)
    if @party.save
      flash[:success] = "You have created your party successfully."
    else
      render :new
      flash[:error] = error_messages(@party)
    end
  end

  def update
    if @party.update(permitted_params)
      flash[:success] = "You have updated your party successfully."
    else
      render :edit
      flash[:error] = error_messages(@party)
    end
  end

  def destroy
    if @party.destroy
      flash[:success] = "You have deleted your party successfully."
    else
      flash[:error] = error_messages(@party)
    end
    redirect_to parties_path
  end

  private
  
  def load_party
    @party = current_user.parties.find(params[:id])
  end

  def permitted_params
    params.require(:party).permit(:start_at, :end_at, :venue, :is_active)
  end
end
