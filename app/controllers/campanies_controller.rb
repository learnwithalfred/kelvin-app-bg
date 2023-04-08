class CampaniesController < ApplicationController
  before_action :set_campany, only: %i[show update destroy]

  # GET /campanies
  def index
    @campanies = Campany.all

    render json: @campanies
  end

  # GET /campanies/1
  def show
    render json: @campany.to_json(include: [:products])
  end

  # POST /campanies
  def create
    @campany = Campany.new(campany_params)

    if @campany.save
      render json: @campany, status: :created, location: @campany
    else
      render json: @campany.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /campanies/1
  def update
    if @campany.update(campany_params)
      render json: @campany
    else
      render json: @campany.errors, status: :unprocessable_entity
    end
  end

  # DELETE /campanies/1
  def destroy
    @campany.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_campany
    @campany = Campany.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def campany_params
    params.require(:campany).permit(:name)
  end
end
