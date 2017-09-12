class CustodiansController < ApplicationController
  before_action :set_custodian, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /custodians
  # GET /custodians.json
 def index
    if params[:search]
      @custodians = Custodian.search(params[:search]).order("name ASC").paginate(page: params[:page], per_page: 10)
    else
      @custodians = Custodian.order("name ASC").paginate(page: params[:page], per_page: 10)
    end
  end

  # GET /custodians/1
  # GET /custodians/1.json
  def show
    total  = 0
    @custodian.plans.each do |ma|
      total += ma.total
    end
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CustodianPdf.new(@custodian, view_context, total)
        send_data pdf.render, type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /custodians/new
  def new
    @custodian = Custodian.new
  end

  # GET /custodians/1/edit
  def edit
  end

  # POST /custodians
  # POST /custodians.json
  def create
    @custodian = Custodian.new(custodian_params)

    respond_to do |format|
      if @custodian.save
        format.html { redirect_to @custodian, notice: 'Custodian was successfully created.' }
        format.json { render action: 'show', status: :created, location: @custodian }
      else
        format.html { render action: 'new' }
        format.json { render json: @custodian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custodians/1
  # PATCH/PUT /custodians/1.json
  def update
    respond_to do |format|
      if @custodian.update(custodian_params)
        format.html { redirect_to @custodian, notice: 'Custodian was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @custodian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custodians/1
  # DELETE /custodians/1.json
  def destroy
    @custodian.destroy
    respond_to do |format|
      format.html { redirect_to custodians_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custodian
      @custodian = Custodian.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custodian_params
      params.require(:custodian).permit(:name)
    end
end
