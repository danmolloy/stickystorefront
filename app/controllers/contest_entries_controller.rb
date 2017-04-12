class ContestEntriesController < ApplicationController

  def create
    entry = ContestEntry.create(email_id: Email.find_or_create_by(address: params[:email].downcase).id)
    p entry.inspect
  end

  private
  def entry_params
    params.require(:email)
  end
end
