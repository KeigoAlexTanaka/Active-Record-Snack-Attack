class SnacksController < ApplicationController

  def index
    if params[:consumer_id]
      @consumer = Consumer.find(params[:consumer_id])
      @snacks = @consumer.snacks
    elsif params[:brand_id]
      @brand = Brand.find(params[:brand_id])
      @snacks = @brand.snacks
    else
      @snacks = Snack.all
    end
  end

  def show
    @snack = Snack.find(params[:id])
  end
end
