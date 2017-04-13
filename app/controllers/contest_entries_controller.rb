class ContestEntriesController < ApplicationController
  before_action :get_entry, only: [:show]

  def create
    @email = Email.find_or_create_by(address: params[:email].downcase)
    @entry = ContestEntry.new(email_id: @email.id)
    if @entry.save
      @entry.ask_for_prizes
      redirect_to contest_entry_path(@entry)
    else
      @entry.errors.each do |key, message|
        flash[:alert] = "Error: #{message}"
      end
      redirect_back(fallback_location: :root)
    end
  end

  def show
  end

  private


  def get_entry
    @entry = ContestEntry.find(params[:id])
  end

  def entry_params
    params.require(:email)
  end
end
