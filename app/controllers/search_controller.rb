class SearchController < ApplicationController
  before_action :authenticate_user!


  def index
  end



  def results
    @orders = Order.all.where('vendor LIKE ?', "%#{params[:q]}%")
    # @orders = Order.all.where('po_number LIKE ?', "%#{params[:q]}%")
    #       .parameterize
  end

end
