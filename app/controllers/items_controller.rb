class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def dashboard
    @items = Item.all
    @trades = Trade.all
    if user_signed_in?
      @user_devise = current_user
      @items = Item.select( :user_id == current_user.id )

      @trades_incoming = Trade.select { |trade| trade.receiver_id == @user_devise.id}
      @trades_outgoing = Trade.select{ |trade| trade.initiator_id == @user_devise.id}
    end
  end

  def index
    @items = Item.all
    @user = current_user
    if params[:query].present? #search bar params
      @items = @items.where("name ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @trades = Trade.all
    @trade = Trade.new
  end

  def new
    @item = Item.new
  end

  def create
    if current_user
      @item = Item.new(item_params)
      @item.user = current_user
      if @item.save
        redirect_to item_path(@item)
      else
        redirect_to new_user_session_path, notice: 'You are not logged in.'
      end
    end
  end


  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@list)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to items, status: :see_other
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :price, :description, :category, :title, :body, :photo) #:current_user
  end
end
