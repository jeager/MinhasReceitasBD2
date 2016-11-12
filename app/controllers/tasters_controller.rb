class TastersController < ApplicationController
  before_action :set_taster, only: [:show, :edit, :update, :destroy]

  # GET /tasters
  # GET /tasters.json
  def index
    @tasters = Taster.all
  end

  # GET /tasters/1
  # GET /tasters/1.json
  def show
  end

  # GET /tasters/new
  def new
    @taster = Taster.new
  end

  # GET /tasters/1/edit
  def edit
  end

  # POST /tasters
  # POST /tasters.json
  def create
    @taster = Taster.new(taster_params)

    respond_to do |format|
      if @taster.save
        format.html { redirect_to @taster, notice: 'Taster was successfully created.' }
        format.json { render :show, status: :created, location: @taster }
      else
        format.html { render :new }
        format.json { render json: @taster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasters/1
  # PATCH/PUT /tasters/1.json
  def update
    respond_to do |format|
      if @taster.update(taster_params)
        format.html { redirect_to @taster, notice: 'Taster was successfully updated.' }
        format.json { render :show, status: :ok, location: @taster }
      else
        format.html { render :edit }
        format.json { render json: @taster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasters/1
  # DELETE /tasters/1.json
  def destroy
    @taster.destroy
    respond_to do |format|
      format.html { redirect_to tasters_url, notice: 'Taster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taster
      @taster = Taster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def taster_params
      params.require(:taster).permit(:employee_id)
    end
end
