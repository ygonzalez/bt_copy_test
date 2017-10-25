class AssetClassesController < ApplicationController
  before_action :set_asset_class, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /asset_classes
  # GET /asset_classes.json
  def index
    @asset_classes = AssetClass.all
  end

  # GET /asset_classes/1
  # GET /asset_classes/1.json
  def show
  end

  # GET /asset_classes/new
  def new
    @asset_class = AssetClass.new
  end

  # GET /asset_classes/1/edit
  def edit
  end

  # POST /asset_classes
  # POST /asset_classes.json
  def create
    @asset_class = AssetClass.new(asset_class_params)

    respond_to do |format|
      if @asset_class.save
        format.html { redirect_to @asset_class, notice: 'Asset class was successfully created.' }
        format.json { render action: 'show', status: :created, location: @asset_class }
      else
        format.html { render action: 'new' }
        format.json { render json: @asset_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asset_classes/1
  # PATCH/PUT /asset_classes/1.json
  def update
    respond_to do |format|
      if @asset_class.update(asset_class_params)
        format.html { redirect_to @asset_class, notice: 'Asset class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @asset_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_classes/1
  # DELETE /asset_classes/1.json
  def destroy
    @asset_class.destroy
    respond_to do |format|
      format.html { redirect_to asset_classes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset_class
      @asset_class = AssetClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_class_params
      params.require(:asset_class).permit(:name)
    end
end
