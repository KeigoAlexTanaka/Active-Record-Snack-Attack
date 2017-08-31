class ConsumersController < ApplicationController
  def index
    @consumers = Consumer.all

    # the line below is implicit
    # render :index
  end

  def show
    @consumer = Consumer.find(params[:id])

    # the line below is implicit
    # render :show
  end
end
