class PurchasesController < ApplicationController
  
  def index
    if current_user
      list = Purchase.select(:item_id)
      @allitems = Item.where('user_id != ? AND id NOT IN (?)',current_user.id,list)
      # @items = Item.where('user_id != ?',current_user.id)
    end
    
  end

  def create
    if current_user
       item = Item.find(params[:id])
       item.date = Date.today
       item.save
       Purchase.create(user:current_user,item:Item.find(params[:id]))
       redirect_to '/users/profile'
    else
        redirect_to '/sessions/new' 
    end 
  end
  
end
