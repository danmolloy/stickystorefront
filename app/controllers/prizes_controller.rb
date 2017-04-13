class PrizesController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'sticky'
  before_action :get_prize, only: [:show, :edit, :update, :destroy]
  before_action :get_last_entry, only: [:index]

  def index
    @prizes = Prize.all
  end

  def new
    @prize = Prize.new
  end

  def create
    @prize = Prize.new(prize_params)
    if @prize.save
      flash[:notice] = 'Prize creation successful'
      redirect_to prize_path(@prize)
    else
      flash.now[:alert] = 'Error creating prize'
      render :new
    end
  end

  def show
    @conditions = @prize.conditions
  end

  def edit
  end

  def update
    if @prize.update_attributes(prize_params)
      flash[:notice] = 'Update successful'
      redirect_to prize_path(@prize)
    else
      flash[:alert] = 'Error updating prize'
      render :edit
    end
  end

  def destroy
    if @prize.destroy
      flash[:notice] = 'Deletion successful'
      redirect_to prizes_path
    else
      flash[:alert] = 'Error deleting prize'
    end
  end


  private
  def get_last_entry
    @last_entry = ContestEntry.last
  end

  def get_prize
    @prize = Prize.find(params[:id])
  end

  def prize_params
    params.require(:prize).permit(:stock, :name, :id)
  end

end
