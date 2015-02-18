class ItemsController < ApplicationController
  load_and_authorize_resource

  respond_to :html

  def index
    @items = Item.all
    respond_with(@items)
  end

  def show
    respond_with(@item)
  end

  def create
    @item.user_id = current_user.id
    @item.save
    respond_with(@item)
  end

  def update
    @item.update!(item_params)
    respond_with(@item)
  end

  def destroy
    @item.destroy
    respond_with(@item)
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :Price, :user_id)
    end
end
