class ManagersController < ApplicationController
  before_action :set_manager, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /managers
  # GET /managers.json
 def index
    @asset_classes = AssetClass.all
    if params[:search]
      @managers = Manager.search(params[:search]).order("man_name ASC").paginate(page: params[:page], per_page: 10)
    else
      if params[:asset_class_id]
        @managers = Manager.asset_class_find(params[:asset_class_id]).order("man_name ASC").paginate(page: params[:page], per_page: 10)
        @assets = AssetClass.find(params[:asset_class_id])
      else
        @managers = Manager.order("man_name ASC").paginate(page: params[:page], per_page: 10)
      end
    end
  end


  # GET /managers/1
  # GET /managers/1.json
  def show
    total  = 0
    @manager.accounts.each do |ma|
      total += ma.market_value
    end
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ManagerPdf.new(@manager, view_context, total)
        send_data pdf.render, type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /managers/new
  def new
    @manager = Manager.new
  end

  # GET /managers/1/edit
  def edit
  end

  # POST /managers
  # POST /managers.json
  def create
    @manager = Manager.new(manager_params)

    respond_to do |format|
      if @manager.save
        format.html { redirect_to @manager, notice: 'Manager was successfully created.' }
        format.json { render action: 'show', status: :created, location: @manager }
      else
        format.html { render action: 'new' }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /managers/1
  # PATCH/PUT /managers/1.json
  def update
    respond_to do |format|
      if @manager.update(manager_params)
        format.html { redirect_to @manager, notice: 'Manager was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managers/1
  # DELETE /managers/1.json
  def destroy
    @manager.destroy
    respond_to do |format|
      format.html { redirect_to managers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager
      @manager = Manager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_params
      params.require(:manager).permit(:name)
    end
end
