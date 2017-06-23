class ItemsController < ApplicationController
  
  def index 
    if current_user
      @items_purchased = current_user.items_purchased
      list = Purchase.select(:item_id)
      @items_sold = Item.where('user_id = ? AND id IN (?)',current_user.id,list)
      @items_pending = Item.where('user_id = ? AND id NOT IN (?)',current_user.id,list)
    else
      redirect_to "/sessions/new"
    end   
  end

  def create
    @item = Item.new(item_params)
        unless @item.save
            flash[:error] = @item.errors.full_messages
        end
         redirect_to '/users/profile'
  end

  def destroy
      item = Item.find(params[:id])
     item.destroy if item.user === current_user
     redirect_to '/users/profile'
  end

  private
    def item_params
      params.require(:item).permit(:product_name,:amount).merge(user: current_user) 
    end
  




end
