class PurchasersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchaser, only: %i[ show edit update destroy ]
  before_action :set_title, only: :show
  before_action :is_active_tab

  # GET /purchaser_orders

  # GET /purchasers or /purchasers.json
  def index

    @q = Purchaser.search(params[:q])
    @purchasers = @q.result



    # @purchasers = Purchaser.paginate(page: params[:page])
    # @purchasers = Purchaser.paginate(:page => params[:page], :per_page => 5).order(created_at: :desc)

    # @purchasers = Purchaser.all.reverse
    @purchaser = current_user.purchasers.build
    @orders = @purchaser.orders
    @new_order = Order.new
    respond_to do |format|
      format.html
      format.csv {send_data @purchaser.to_csv}
    end
  end



  # GET /purchasers/1 or /purchasers/1.json
  def show
    @purchaser = Purchaser.find(params[:id])
    # @new_order = Order.new
    @orders = @purchaser.orders
    @order = Order.new

    @page_title = "Purchasers#Show"

  end

  # GET /purchasers/new
  def new
    @purchaser = current_user.purchasers.build
  end

  # GET /purchasers/1/edit
  def edit
    @purchaser = Purchaser.find(params[:id])
  end

  # POST /purchasers or /purchasers.json
  def create
    @purchaser = current_user.purchasers.build(purchaser_params)

    respond_to do |format|
      if @purchaser.save
        format.html { redirect_to purchasers_path, notice: "Purchaser was successfully created." }
        format.json { render :show, status: :created, location: purchasers_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchaser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchasers/1 or /purchasers/1.json
  def update
    respond_to do |format|
      if @purchaser.update(purchaser_params)
        format.html { redirect_to @purchaser, notice: "Purchaser was successfully updated." }
        format.json { render :show, status: :ok, location: @purchaser }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchaser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchasers/1 or /purchasers/1.json
  def destroy
    @purchaser.destroy
    respond_to do |format|
      format.html { redirect_to user_purchasers_path(current_user), notice: "Purchaser was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_title
      @set_page_title = true
      # @page_title = "Purchasers"
    end

    def is_active_tab
      @active_purchasers_tab = true
    end


    def set_purchaser
      @purchaser = Purchaser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchaser_params
      params.require(:purchaser).permit(:name, :po_number, :date_recieved, :date_delivered, :distributed_by, :user_id)
    end
end
