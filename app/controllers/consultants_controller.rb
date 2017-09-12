class ConsultantsController < ApplicationController
  before_action :set_consultant, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /consultants
  # GET /consultants.json
  def index
    if params[:search]
      @consultants = Consultant.search(params[:search]).order("name ASC").paginate(page: params[:page], per_page: 10)
    else
      @consultants = Consultant.order("name ASC").paginate(page: params[:page], per_page: 10)
    end
  end

  # GET /consultants/1
  # GET /consultants/1.json
  def show
    total  = 0
    @consultant.plans.each do |ma|
      total += ma.total
    end
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ConsultantPdf.new(@consultant, view_context, total)
        send_data pdf.render, type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /consultants/new
  def new
    @consultant = Consultant.new
  end

  # GET /consultants/1/edit
  def edit
  end

  # POST /consultants
  # POST /consultants.json
  def create
    @consultant = Consultant.new(consultant_params)

    respond_to do |format|
      if @consultant.save
        format.html { redirect_to @consultant, notice: 'Consultant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @consultant }
      else
        format.html { render action: 'new' }
        format.json { render json: @consultant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consultants/1
  # PATCH/PUT /consultants/1.json
  def update
    respond_to do |format|
      if @consultant.update(consultant_params)
        format.html { redirect_to @consultant, notice: 'Consultant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @consultant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consultants/1
  # DELETE /consultants/1.json
  def destroy
    @consultant.destroy
    respond_to do |format|
      format.html { redirect_to consultants_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultant
      @consultant = Consultant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consultant_params
      params.require(:consultant).permit(:name)
    end
end
