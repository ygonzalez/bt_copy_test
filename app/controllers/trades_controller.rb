class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /trades
  # GET /trades.json
  def index

    if current_user.has_role? :smw
      if params[:search]
        @trades = Trade.search(params[:search]).where("id=2").order("name ASC").paginate(page: params[:page], per_page: 10)
      else
        @trades = Trade.where("id=2").order("name ASC").paginate(page: params[:page], per_page: 10)
      end
    elsif current_user.has_role? :iw
      if params[:search]
        @trades = Trade.search(params[:search]).where("id=1").order("name ASC").paginate(page: params[:page], per_page: 10)
      else
        @trades = Trade.where("id=1").order("name ASC").paginate(page: params[:page], per_page: 10)
      end
    else
      if params[:search]
        @trades = Trade.search(params[:search]).order("name ASC").paginate(page: params[:page], per_page: 10)
      else
        @trades = Trade.order("name ASC").paginate(page: params[:page], per_page: 10)
      end
    end
  end

  # GET /trades/1
  # GET /trades/1.json
  def show
    total  = 0
    @trade.plans.each do |pm|
      total += pm.total
    end
    respond_to do |format|
      format.html
      format.pdf do
        pdf = TradePdf.new(@trade, view_context, total)
        send_data pdf.render, type: "application/pdf", disposition: "inline"

      end
    end
  end

  # GET /trades/new
  def new
    @trade = Trade.new
  end

  # GET /trades/1/edit
  def edit
  end

  # POST /trades
  # POST /trades.json
  def create
    @trade = Trade.new(trade_params)

    respond_to do |format|
      if @trade.save
        format.html { redirect_to @trade, notice: 'Trade was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trade }
      else
        format.html { render action: 'new' }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trades/1
  # PATCH/PUT /trades/1.json
  def update
    respond_to do |format|
      if @trade.update(trade_params)
        format.html { redirect_to @trade, notice: 'Trade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @trade.destroy
    respond_to do |format|
      format.html { redirect_to trades_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_params
      params.require(:trade).permit(:name)
    end
end
