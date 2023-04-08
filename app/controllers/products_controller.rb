class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[create update destroy]
  # GET /products
  def index
    @products = Product.all

    render json: @products.to_json(include: %i[campany category])
  end

  # GET /products/1
  def show
    render json: @product.to_json(include: %i[campany category orders])
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    authorize! :create, @product
    if @product.save
      render json: @product.to_json(include: %i[campany category]), status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    authorize! :create, @product
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    authorize! :destroy, @product
    @product.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:category_id, :campany_id, :name, :price, :description, :img)
  end
end
