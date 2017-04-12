class ConditionsController < ApplicationController
  before_action :get_prize
  before_action :get_condition, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(condition_params)
    @condition.prize_id = params[:prize_id]
    if @condition.save
      flash[:notice] = 'Condition creation successful'
      redirect_to prize_path(@prize)
    else
      flash[:alert] = 'Error creating condition'
      render :new
    end
  end

  def edit
  end

  def update
    if @condition.update_attributes(condition_params)
      flash[:notice] = 'Update successful'
      redirect_to prize_path(@prize)
    else
      flash[:alert] = 'Error updating condition'
      render :edit
    end
  end

  def destroy
    if @condition.destroy
      flash[:notice] = 'Deletion successful'
      redirect_to prize_path(@prize)
    else
      flash[:alert] = 'Error deleting condition'
    end
  end

  private
  def condition_params
    params.require(:condition).permit(:after, :before,
                                      :multiple_of, :specific_numbers, :id)
  end

  def get_prize
    @prize = Prize.find(params[:prize_id])
  end

  def get_condition
    @condition = Condition.find(params[:id])
  end
end
