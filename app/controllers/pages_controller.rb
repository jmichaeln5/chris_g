class PagesController < ApplicationController
  def index
      @set_landing_page = true
      @page_title = "pages/index"
  end

  def about
  end

  def test_page
    # @purchasers = Purchaser.paginate(:page => params[:page], :per_page => 5).order(created_at: :desc)
    @purchasers = Purchaser.all
    @purchasers_grid = initialize_grid(Purchaser)
    @purchaser = current_user.purchasers.build
    @orders = @purchaser.orders
    @new_order = Order.new
  end

end
