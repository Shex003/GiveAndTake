class TradesController < ApplicationController
  before_action :authenticate_user!

  def new
    @trade = Trade.new
  end

  def create
    if current_user
      @trade = Trade.new(trade_params)
      @trade.initiator = current_user
      @trade.offered_item = Item.find_by(id: params[:trade][:offered_item_id])
      @item = Item.find_by(id: params[:trade][:requested_item_id])
      @trade.requested_item = @item
      @trade.receiver = @item.user
      @trade.status = false
      if @trade.save
        # temporarily redirect to home
        # will redirect somewhere else when we have the profile page?
        redirect_to root_path
      else
        # if trade does not save
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    @trade = Trade.find(params[:id])
  end

  def update
    @trade = Trade.find(params[:id])
    @trade.status = !@trade.status
    if @trade.save
      redirect_to dashboard_path, notice: 'Trade status updated successfully.'
    else
      redirect_to dashboard_path, alert: 'Failed to update trade status.'
    end
  end

  def destroy
    @trade = Trade.find(params[:id])
    if @trade.destroy
      redirect_to dashboard_path, notice: 'Trade declined successfully.'
    else
      redirect_to dashboard_path, alert: 'Failed to update trade status.'
    end
  end

  private

  def trade_params
    params.require(:trade).permit(:initiator, :receiver, :offered_item, :requested_item)
  end
end
