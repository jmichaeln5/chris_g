class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :set_title, only: :show
  before_action :is_active_tab

  # GET /all_orders
  def all_orders
    @orders = Order.all

    # @test_pop = request.env['PATH_INFO']
    # @test_pop = __callee__
    # @test_pop = all_orders_path
  end


  # GET /orders or /orders.json
  def index
    @purchaser = Purchaser.find(params[:purchaser_id])
    @orders = @purchaser.orders.all.reverse
  end

  # GET /orders/1 or /orders/1.json
  def show
    @order = Order.find(params[:id])
    @page_title = "Orders#Show"

  end

  # GET /orders/new
  def new
    # @order = Order.new
    @order = Order.new
    @purchaser = Purchaser.find(params[:purchaser_id])
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    @purchaser = Purchaser.find(params[:purchaser_id])

    if @order.date_recieved.present? == false
      @order.date_recieved = DateTime.current.to_date
    end

    # byebug

    respond_to do |format|
      if @order.save
        format.html { redirect_to purchasers_path, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        # format.html { render :new, status: :unprocessable_entity }
        format.html { redirect_to purchasers_path, alert: "Order could not be created." }

        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to purchasers_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_title
      @set_page_title = true
      # @page_title = "Orders"
    end

    def is_active_tab
      @active_orders_tab = true
    end

    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:name, :content, :amount, :vendor, :po_number, :date_recieved, :date_delivered, :distributed_by, :purchaser_id)
    end
end
