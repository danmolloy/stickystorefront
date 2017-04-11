class PrizesController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'sticky'

  def index
  end
end
