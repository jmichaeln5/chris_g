class SearchController < ApplicationController
  before_action :authenticate_user!


  def index
  end



  def results
    # @orders = Order.all.where('po_number LIKE ?', "%#{params[:q]}%")
    #       .parameterize
    # byebug

    case params["commit"]
    when {"purchasers"=>"Search"}
      @results = Order.all.where('name LIKE ?', "%#{params[:q]}%")
    when {"vendors"=>"Search"}
      @results = Order.all.where('vendor LIKE ?', "%#{params[:q]}%")
    when {"orders"=>"Search"}
      @results = Order.all.where('content LIKE ?', "%#{params[:q]}%")
    end

  end

end
